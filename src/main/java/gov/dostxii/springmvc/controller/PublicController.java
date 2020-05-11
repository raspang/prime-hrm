package gov.dostxii.springmvc.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
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
import gov.dostxii.springmvc.model.PostSubCat;
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
@RequestMapping("/")
@SessionAttributes({ "roles" })
public class PublicController {

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

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());

		User user = userService.findBySSO(getPrincipal());
		if(user != null)
		model.addAttribute("userDocuments", user.getUserDocuments());
		return "home";
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(@RequestParam(name = "id", required = false) Integer id, ModelMap model) {
		/*
		 * List<Post> posts =
		 * postService.findAllByCatOrSubCat(PostCategoryOrType.ABOUT.getPostCategory(),
		 * null);
		 */
		model.addAttribute("selectedId", id);
		/* model.addAttribute("posts", posts); */

		model.addAttribute("loggedinuser", getPrincipal());
		return "about";
	}

	@RequestMapping(value = "/imageDisplay", method = RequestMethod.GET)
	public void showImage(@RequestParam(name = "id", required = false) Integer id, HttpServletResponse response,
			HttpServletRequest request) throws ServletException, IOException {

		PostDocument item = postDocumentService.findById(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(item.getContent());

		response.getOutputStream().close();

	}

	@RequestMapping(value = "/prime-hrm", method = RequestMethod.GET)
	public String prime(@RequestParam(name = "cat", required = false) String cat,
			@RequestParam(name = "subcat", required = false) String subcat, ModelMap model) {
		model.addAttribute("cat", cat);
		model.addAttribute("subcat", subcat);

		/*
		 * List<Post> posts = postService.findAllByCatOrSubCat(cat, null);
		 * 
		 * model.addAttribute("primehrmlist", posts);
		 */

		model.addAttribute("loggedinuser", getPrincipal());

		if (cat.equals(PostCatOrType.RECRUITMENT.getStr())) {
			model.addAttribute("listRECRUITMENT_GOVERNANCE", postService.findAllByCatOrSubCat(
					PostCatOrType.RECRUITMENT.getStr(), PostSubCat.RECRUITMENT_GOVERNANCE.getStr(),isUserLog()));
			model.addAttribute("listRECRUITMENT_PLANNING", postService.findAllByCatOrSubCat(
					PostCatOrType.RECRUITMENT.getStr(), PostSubCat.RECRUITMENT_PLANNING.getStr(),isUserLog()));
			model.addAttribute("listRECRUITMENT_SOURCING", postService.findAllByCatOrSubCat(
					PostCatOrType.RECRUITMENT.getStr(), PostSubCat.RECRUITMENT_SOURCING.getStr(),isUserLog()));
			model.addAttribute("listRECRUITMENT_SELECTING", postService.findAllByCatOrSubCat(
					PostCatOrType.RECRUITMENT.getStr(), PostSubCat.RECRUITMENT_SELECTING.getStr(),isUserLog()));
		}

		if (cat.equals(PostCatOrType.DEVELOPMENT.getStr())) {
			model.addAttribute("listDEVELOPMENT_GOVERNANCE", postService.findAllByCatOrSubCat(
					PostCatOrType.DEVELOPMENT.getStr(), PostSubCat.DEVELOPMENT_GOVERNANCE.getStr(),isUserLog()));
			model.addAttribute("listDEVELOPMENT_PLANNING", postService.findAllByCatOrSubCat(
					PostCatOrType.DEVELOPMENT.getStr(), PostSubCat.DEVELOPMENT_PLANNING.getStr(),isUserLog()));
			model.addAttribute("listDEVELOPMENT_EXECUTION", postService.findAllByCatOrSubCat(
					PostCatOrType.DEVELOPMENT.getStr(), PostSubCat.DEVELOPMENT_EXECUTION.getStr(),isUserLog()));
		}

		if (cat.equals(PostCatOrType.PERFORMANCE.getStr())) {
			model.addAttribute("listPERFORMANCE_GOVERNANCE", postService.findAllByCatOrSubCat(
					PostCatOrType.PERFORMANCE.getStr(), PostSubCat.PERFORMANCE_GOVERNANCE.getStr(),isUserLog()));
			model.addAttribute("listPERFORMANCE_PLANNING", postService.findAllByCatOrSubCat(
					PostCatOrType.PERFORMANCE.getStr(), PostSubCat.PERFORMANCE_PLANNING.getStr(),isUserLog()));
			model.addAttribute("listPERFORMANCE_REVIEW", postService
					.findAllByCatOrSubCat(PostCatOrType.PERFORMANCE.getStr(), PostSubCat.PERFORMANCE_REVIEW.getStr(),isUserLog()));
			model.addAttribute("listPERFORMANCE_DEVELOPMENT", postService.findAllByCatOrSubCat(
					PostCatOrType.PERFORMANCE.getStr(), PostSubCat.PERFORMANCE_DEVELOPMENT.getStr(),isUserLog()));
		}

		if (cat.equals(PostCatOrType.RECOGNITION.getStr())) {
			model.addAttribute("listRECOGNITION_GOVERNANCE", postService.findAllByCatOrSubCat(
					PostCatOrType.RECOGNITION.getStr(), PostSubCat.RECOGNITION_GOVERNANCE.getStr(),isUserLog()));
			model.addAttribute("listRECOGNITION_PLANNING", postService.findAllByCatOrSubCat(
					PostCatOrType.RECOGNITION.getStr(), PostSubCat.RECOGNITION_PLANNING.getStr(),isUserLog()));
			model.addAttribute("listRECOGNITION_IMPLEMENTATION", postService.findAllByCatOrSubCat(
					PostCatOrType.RECOGNITION.getStr(), PostSubCat.RECOGNITION_IMPLEMENTATION.getStr() ,isUserLog() ));
		}

		return "prime-hrm";
	}

	@RequestMapping(value = "/others", method = RequestMethod.GET)
	public String others(@RequestParam(name = "cat", required = false) String cat, ModelMap model) {

		List<Post> posts = postService.findAllByCatOrSubCat(cat, null,isUserLog());
		model.addAttribute("cat", cat);
		model.addAttribute("listOthers", posts);

		model.addAttribute("loggedinuser", getPrincipal());
		return "others";
	}

	@RequestMapping(value = "/forms", method = RequestMethod.GET)
	public String forms(@RequestParam(name = "cat", required = false) String cat, ModelMap model) {

		List<Post> posts = postService.findAllByCatOrSubCat(cat, null,isUserLog());
		model.addAttribute("cat", cat);
		model.addAttribute("listForms", posts);

		model.addAttribute("loggedinuser", getPrincipal());
		return "forms";
	}

	@RequestMapping(value = { "/download-user-document-{docId}" }, method = RequestMethod.GET)
	public String downloadUserDocument(@PathVariable int docId, HttpServletResponse response) throws IOException {

		UserDocument document = userDocumentService.findById(docId);
		if (document.getUser().getSsoId().equals(getPrincipal())) {
			response.setContentType(document.getType());
			response.setContentLength(document.getContent().length);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + document.getName() + "\"");

			FileCopyUtils.copy(document.getContent(), response.getOutputStream());
		}
		return "redirect:/home";
	}
	
	
	private Boolean isUserLog() {
		return isCurrentAuthenticationAnonymous();
		
		
	}


	@RequestMapping(value = { "/download-document-{postId}-{docId}" }, method = RequestMethod.GET)
	public String downloadDocument(@PathVariable int postId, @PathVariable int docId, HttpServletResponse response)
			throws IOException {
		PostDocument document = postDocumentService.findById(docId);
		response.setContentType(document.getType());
		response.setContentLength(document.getContent().length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + document.getName() + "\"");

		FileCopyUtils.copy(document.getContent(), response.getOutputStream());

		return "redirect:/about?id=" + postId;
	}

	@ModelAttribute("posts")
	public List<Post> initializeAbout() {
		return postService.findAllByCatOrSubCat(PostCatOrType.ABOUT.getStr(), null, isUserLog() );
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
	 * This method handles login GET requests. If users is already logged-in and
	 * tries to goto login page again, will be redirected to list page.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		} else {
			return "redirect:/";
		}
	}

	/**
	 * This method handles logout requests. Toggle the handlers if you are
	 * RememberMe functionality is useless in your app.
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			// new SecurityContextLogoutHandler().logout(request, response, auth);
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";
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

}