tag tabs

	prop tabs
	prop activeTab

	def render
		<self>
			<ul.list--bare> for tab in tabs
				<li@{tab:ref}.tab .is-active=(isActiveTab(tab:ref)) :click='toggleTab' data-ref=tab:ref>
					tab:title
			<div.tabContent> for tab in tabs
				<div@{tab:ref}.tabContent__item .is-active=(isActiveTab(tab:ref))>
					tab:content

	def build
		schedule

	def isActiveTab tab
		return activeTab == tab

	def toggleTab e
		activeTab = e.target.dataset:ref
		e.cancel.halt

var app = <tabs.tabs activeTab='tab1' tabs=[
	{ title: 'Tab 1', ref: 'tab1', content: "(1) PBR ennui church-key plaid food truck, wayfarers Etsy. Cardigan Echo Park craft beer, put a bird on it scenester roof party PBR&B umami tofu trust fund VHS farm-to-table hella skateboard. Godard squid Kickstarter, fanny pack distillery mlkshk meditation scenester leggings paleo single-origin coffee literally kogi. PBR&B slow-carb Marfa, hoodie High Life Bushwick bicycle rights. You probably haven't heard of them keffiyeh artisan, 3 wolf moon umami disrupt fixie Etsy tote bag swag pug selfies YOLO vegan. Craft beer brunch fixie, pug artisan plaid wayfarers cronut. Tote bag sartorial freegan messenger bag, hoodie mlkshk Etsy fanny pack." },
	{ title: 'Tab 2', ref: 'tab2', content: "(2) Lo-fi brunch literally jean shorts, retro pickled taxidermy selfies mlkshk. Mumblecore sartorial drinking vinegar, Pinterest roof party biodiesel pour-over gastropub. Deep v Bushwick church-key, banh mi four dollar toast Carles Helvetica. Sartorial narwhal twee farm-to-table, ethical tousled single-origin coffee. Health goth seitan +1 ugh, artisan pour-over forage blog Vice. Health goth blog Austin shabby chic chillwave drinking vinegar. IPhone 90's cray dreamcatcher, Bushwick seitan bicycle rights." },
	{ title: 'Tab 3', ref: 'tab3', content: "(3) Cred Neutra Godard meditation bespoke. Vice bespoke kitsch, Truffaut selvage Helvetica semiotics Kickstarter fixie plaid jean shorts viral four dollar toast cronut pickled. Organic photo booth scenester readymade Etsy Intelligentsia YOLO, Carles Blue Bottle. Tattooed forage slow-carb lo-fi cornhole. Synth chillwave Pinterest yr, selvage direct trade DIY letterpress lumbersexual Intelligentsia Odd Future pour-over. Kickstarter gastropub synth aesthetic health goth, tote bag lumbersexual Portland food truck asymmetrical. Asymmetrical cliche put a bird on it Austin meggings." }
	]>
($$(#tabs)).prepend app
