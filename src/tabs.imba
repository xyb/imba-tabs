tag tab-handler < li

	prop id
	prop title
	prop fa-icon default: ''
	prop active default: false

	def render
		<self.tab .is-active=active data-id=id>
			if fa-icon
				<div.fa.{fa-icon}>
			title

	def onclick
		up(%tabs).toggle(id)

tag tab-content < div

	prop id
	prop content
	prop active default: false

	def render
		<self.tabContent__item .is-active=active>
			content

tag tabs

	prop tabs
	prop active-tab

	def render
		log 'tabs render'
		<self>
			<ul.list--bare> for tab in tabs
				<tab-handler active=(active-tab == tab:ref) title=tab:title id=tab:ref fa-icon=tab:fa-icon>
			<div.tabContent> for tab in tabs
				<tab-content active=(active-tab == tab:ref) content=tab:content id=tab:ref>

	def build
		schedule

	def toggle id
		active-tab = id

var app = <tabs.tabs active-tab='tab1' tabs=[
	{ title: 'Plain Text', ref: 'tab1', content: 'In computing, plain text is the data (e.g. file contents) which represent only characters of readable material but not its graphical representation nor other objects (images, etc.). It may also include a limited number of characters that control simple arrangement of text, such as line breaks or tabulation characters. Plain text is different from formatted text, where style information is included, and "binary files" in which some portions must be interpreted as binary objects (encoded integers, real numbers, images, etc.).' },
	{ fa-icon: 'fa-image', title: '', ref: 'tab2', content: "An image (from Latin: imago) is an artifact that depicts visual perception, for example a two-dimensional picture, that has a similar appearance to some subject—usually a physical object or a person, thus providing a depiction of it." },
	{ fa-icon: 'fa-file', title: 'File', ref: 'tab3', content: 'A computer file is a resource for storing information, which is available to a computer program and is usually based on some kind of durable storage. A file is "durable" in the sense that it remains available for other programs to use after the program that created it has finished executing. Computer files can be considered as the modern counterpart of paper documents which traditionally are kept in office and library files, and this is the source of the term.' }
	]>
($$(#tabs)).prepend app
