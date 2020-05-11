package gov.dostxii.springmvc.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import gov.dostxii.springmvc.model.FileBucket;
import gov.dostxii.springmvc.model.Post;
import gov.dostxii.springmvc.model.PostCatOrType;
import gov.dostxii.springmvc.model.PostDocument;
import gov.dostxii.springmvc.model.User;
import gov.dostxii.springmvc.model.UserDocument;
import gov.dostxii.springmvc.model.UserProfile;
import gov.dostxii.springmvc.service.PostDocumentService;
import gov.dostxii.springmvc.service.PostService;
import gov.dostxii.springmvc.service.UserDocumentService;
import gov.dostxii.springmvc.service.UserProfileService;
import gov.dostxii.springmvc.service.UserService;
import gov.dostxii.springmvc.util.FileValidator;

@Controller
@RequestMapping("/admin")
@SessionAttributes("roles")
public class AdminController {

	@Autowired
	UserService userService;

	@Autowired
	UserProfileService userProfileService;

	@Autowired
	UserDocumentService userDocumentService;

	@Autowired
	PostService postService;

	@Autowired
	PostDocumentService postDocumentService;

	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;

	@Autowired
	FileValidator fileValidator;

	@InitBinder("fileBucket")
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(fileValidator);
	}

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String admin(ModelMap model) {
		model.addAttribute("mark", "DASHBOARD");
		int totalUploadedFiles = 0;
		int containingUploaded = 0;
		int notUploaded = 0;
		int noCreated = 0;
		for (Post p : postService.findAll()) {
			noCreated++;
			totalUploadedFiles += p.getTotalUploaded();
			if (p.getTotalUploaded() > 0)
				containingUploaded++;
			else if ((p.getUrl() == null || p.getUrl().isEmpty())
					&& (p.getContent() == null || p.getContent().isEmpty()))
				notUploaded++;

		}
		model.addAttribute("cat", "DASHBOARD");
		model.addAttribute("totalUploadedFiles", totalUploadedFiles);
		model.addAttribute("containingUploaded", containingUploaded);
		model.addAttribute("notUploaded", notUploaded);
		model.addAttribute("noCreated", noCreated);

		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/dashboard";
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String adminAbout(@RequestParam(name = "cat", required = false) String cat,
			@RequestParam(name = "subcat", required = false) String subcat, ModelMap model) {
		List<Post> posts = postService.findAllByCatOrSubCat(cat, subcat,false);
		model.addAttribute("cat", cat);
		model.addAttribute("subcat", subcat);
		model.addAttribute("posts", posts);

		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/about";
	}

	@RequestMapping(value = "/listposts", method = RequestMethod.GET)
	public String listpost(@RequestParam(name = "cat", required = false) String cat,
			@RequestParam(name = "subcat", required = false) String subcat, ModelMap model) {
		List<Post> posts = postService.findAllByCatOrSubCat(cat, subcat,false);
		model.addAttribute("cat", cat);
		model.addAttribute("subcat", subcat);
		model.addAttribute("posts", posts);
		model.addAttribute("loggedinuser", getPrincipal());
		return "postslist";
	}

	@RequestMapping(value = { "/newpost" }, method = RequestMethod.GET)
	public String newPost(@RequestParam(name = "cat", required = false) String cat,
			@RequestParam(name = "subcat", required = false) String subcat, ModelMap model) {
		Post post = new Post();
		post.setCategory(cat);
		post.setSubCategory(subcat);
		model.addAttribute("post", post);
		model.addAttribute("edit", false);
		model.addAttribute("cat", post.getCategory());
		model.addAttribute("subcat", post.getSubCategory());
		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/post";
	}

	@RequestMapping(value = { "/newpost" }, method = RequestMethod.POST)
	public String savePost(@Valid Post post, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "admin/post";
		}

		postService.savePost(post);
		;
		model.addAttribute("post", post);

		model.addAttribute("cat", post.getCategory());
		model.addAttribute("subcat", post.getSubCategory());
		model.addAttribute("success", "Post: " + post.getTitle() + " successfully");
		model.addAttribute("loggedinuser", getPrincipal());

		return "redirect:/admin/about";
	}

	@RequestMapping(value = { "/edit-post-{id}" }, method = RequestMethod.GET)
	public String editPost(@PathVariable Integer id, ModelMap model) {
		Post post = postService.findById(id);
		model.addAttribute("post", post);
		model.addAttribute("cat", post.getCategory());
		model.addAttribute("subcat", post.getSubCategory());
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/post";
	}

	@RequestMapping(value = { "/edit-post-{id}" }, method = RequestMethod.POST)
	public String updatePost(@Valid Post post, BindingResult result, ModelMap model, @PathVariable Integer id) {

		if (result.hasErrors()) {
			return "admin/post";
		}

		postService.updatePost(post);

		model.addAttribute("cat", post.getCategory());
		model.addAttribute("subcat", post.getSubCategory());
		model.addAttribute("success", "Post " + post.getTitle() + " updated successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "redirect:/admin/about";
	}

	@RequestMapping(value = { "/delete-post-{id}" }, method = RequestMethod.GET)
	public String deletePost(@PathVariable Integer id) {
		Post post = postService.findById(id);
		postService.deleteById(id);
		return "redirect:/admin/about?cat=" + post.getCategory() + "&subcat=" + post.getSubCategory();
	}

	@RequestMapping(value = { "/add-document-{postId}" }, method = RequestMethod.GET)
	public String addDocuments(@PathVariable int postId, ModelMap model) {
		Post post = postService.findById(postId);
		model.addAttribute("post", post);

		model.addAttribute("cat", post.getCategory());
		model.addAttribute("subcat", post.getSubCategory());

		FileBucket fileModel = new FileBucket();
		model.addAttribute("fileBucket", fileModel);

		List<PostDocument> documents = postDocumentService.findAllByPostId(postId);
		model.addAttribute("documents", documents);

		return "admin/documentfile";
	}

	@RequestMapping(value = { "/add-document-{postId}" }, method = RequestMethod.POST)
	public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model,
			@PathVariable int postId) throws IOException {

		if (result.hasErrors()) {
			System.out.println("validation errors");
			Post post = postService.findById(postId);
			model.addAttribute("post", post);

			List<PostDocument> documents = postDocumentService.findAllByPostId(postId);
			model.addAttribute("documents", documents);

			return "admin/documentfile";
		} else {

			System.out.println("Fetching file");

			Post post = postService.findById(postId);
			model.addAttribute("post", post);

			saveDocument(fileBucket, post);

			return "redirect:/admin/add-document-" + postId;
		}
	}

	private void saveDocument(FileBucket fileBucket, Post post) throws IOException {

		PostDocument document = new PostDocument();

		MultipartFile multipartFile = fileBucket.getFile();

		document.setName(multipartFile.getOriginalFilename());
		document.setDescription(fileBucket.getDescription());
		document.setType(multipartFile.getContentType());
		document.setContent(multipartFile.getBytes());
		document.setPost(post);
		postDocumentService.saveDocument(document);
	}

	@RequestMapping(value = { "/delete-document-{postId}-{docId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int postId, @PathVariable int docId) {
		postDocumentService.deleteById(docId);
		return "redirect:/admin/add-document-" + postId;
	}

	@RequestMapping(value = { "/download-document-{postId}-{docId}" }, method = RequestMethod.GET)
	public String downloadDocument(@PathVariable int postId, @PathVariable int docId, HttpServletResponse response)
			throws IOException {
		PostDocument document = postDocumentService.findById(docId);
		response.setContentType(document.getType());
		response.setContentLength(document.getContent().length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + document.getName() + "\"");

		FileCopyUtils.copy(document.getContent(), response.getOutputStream());

		return "redirect:/admin/add-document-" + postId;
	}

	@RequestMapping(value = { "/download-user-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public String downloadUserDocument(@PathVariable int userId, @PathVariable int docId, HttpServletResponse response) throws IOException {

		UserDocument document = userDocumentService.findById(docId);

		response.setContentType(document.getType());
		response.setContentLength(document.getContent().length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + document.getName() + "\"");

		FileCopyUtils.copy(document.getContent(), response.getOutputStream());

		return "redirect:/admin/add-user-document-"+userId;
	}

	/**
	 * This method will provide UserProfile list to views
	 */
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}

	/**
	 * This method handles Access-Denied redirect.
	 */
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessDenied";
	}

	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	/**
	 * This method returns true if users is already authenticated [logged-in], else
	 * false.
	 */
	private boolean isCurrentAuthenticationAnonymous() {
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authenticationTrustResolver.isAnonymous(authentication);
	}

	/**
	 * This method will list all existing users.
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/userslist";
	}

	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "admin/registration";
		}

		/*
		 * Preferred way to achieve uniqueness of field [sso] should be implementing
		 * custom @Unique annotation and applying it on field [sso] of Model class
		 * [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you can fill
		 * custom errors outside the validation framework as well while still using
		 * internationalized messages.
		 * 
		 */
		if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
			FieldError ssoError = new FieldError("user", "ssoId", messageSource.getMessage("non.unique.ssoId",
					new String[] { user.getSsoId() }, Locale.getDefault()));
			result.addError(ssoError);
			return "registration";
		}

		userService.saveUser(user);
		model.addAttribute("user", user);

		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		// return "success";
		return "admin/registrationsuccess";
	}

	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String ssoId) {

		if (result.hasErrors()) {
			return "admin/registration";
		}

		/*
		 * //Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in UI which
		 * is a unique key to a User. if(!userService.isUserSSOUnique(user.getId(),
		 * user.getSsoId())){ FieldError ssoError =new
		 * FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new
		 * String[]{user.getSsoId()}, Locale.getDefault())); result.addError(ssoError);
		 * return "registration"; }
		 */

		userService.updateUser(user);

		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "admin/registrationsuccess";
	}

	/**
	 * This method will delete an user by it's SSOID value.
	 */
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/admin/list";
	}

	@RequestMapping(value = { "/add-user-document-{userId}" }, method = RequestMethod.GET)
	public String addUserDocuments(@PathVariable int userId, ModelMap model) {
		User user = userService.findById(userId);
		model.addAttribute("user", user);

		FileBucket fileModel = new FileBucket();
		model.addAttribute("fileBucket", fileModel);

		List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
		model.addAttribute("documents", documents);

		return "admin/managedocuments";
	}

	@RequestMapping(value = { "/add-user-document-{userId}" }, method = RequestMethod.POST)
	public String uploadUserDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model,
			@PathVariable int userId) throws IOException {

		if (result.hasErrors()) {
			System.out.println("validation errors");
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
			model.addAttribute("documents", documents);

			return "admin/managedocuments";
		} else {

			System.out.println("Fetching file");

			User user = userService.findById(userId);
			model.addAttribute("user", user);

			saveDocument(fileBucket, user);

			return "redirect:/admin/add-user-document-" + userId;
		}
	}

	private void saveDocument(FileBucket fileBucket, User user) throws IOException {

		UserDocument document = new UserDocument();

		MultipartFile multipartFile = fileBucket.getFile();

		document.setName(multipartFile.getOriginalFilename());
		document.setDescription(fileBucket.getDescription());
		document.setType(multipartFile.getContentType());
		document.setContent(multipartFile.getBytes());
		document.setUser(user);
		userDocumentService.saveDocument(document);
	}

	@RequestMapping(value = { "/delete1-user-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public String deleteUserDocument(@PathVariable int userId, @PathVariable int docId) {
		userDocumentService.deleteById(docId);
		return "redirect:/admin/add-user-document-" + userId;
		
	}


	
}