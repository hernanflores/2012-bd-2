import org.springframework.web.servlet.i18n.SessionLocaleResolver
// Place your Spring DSL code here
beans = {
	localeResolver(SessionLocaleResolver) {
		defaultLocale= new Locale("es")
		Locale.setDefault (defaultLocale)
		java.util.Locale.setDefault(defaultLocale)
	 }
}
