<app>

    <section class="hero is-light { 'is-fullheight is-bold': $app._page == 'home' }">
        <div class="hero-head">
            <header class="nav">
                <div class="container">
                    <div class="nav-left">
                        <a class="nav-item">
                            <span class="title t-5">#Template</span>
                        </a>
                    </div>

                    <span class="nav-toggle" onclick="{ togglemenu }">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                    <div class="nav-right nav-menu is-medium">
                        <a class="nav-item { 'is-active': $app._page == 'home' }" href="#/home">
                            Home
                        </a>
                        <a class="nav-item { 'is-active': $app._page == 'page1' }" href="#/page1">
                            Page 1
                        </a>
                        <a class="nav-item { 'is-active': $app._page == 'page2' }" href="#/page2">
                            Page 2
                        </a>
                        <a class="nav-item { 'is-active': $app._page == 'about' }" href="#/about">
                            About
                        </a>
                    </div>
                </div>
            </header>
        </div>

        <div class="hero-body" hide="{ $app._page != 'home' }">
            <div class="container">
                <h1 class="title is-1">
                    Template
                </h1>
                <h2 class="subtitle is-4">
                    for RiotJS & Bulma apps
                </h2>
                <a class="button is-large is-light is-inverted is-outlined" href="#/about">
                    <span class="icon">
                        <i class="fa fa-code"></i>
                    </span>
                    <span> About </span> 
                </a>
            </div>
        </div>
    </section>

    <router>
        <route path=""><home/></route>
        <route path="/home"><home/></route>
        <route path="/page1"><page1/></route>
        <route path="/page2"><page2/></route>
        <route path="/about"><about/></route>
    </router>

    <script>
        $app = this
        
        $app._page = 'home'
        
        route.start(true)

        this.togglemenu = function() {
            $('.nav-menu').toggleClass('is-active')
        }
    </script>
</app>

<home>
    <script>
        this.on('route', function() {
            $app._page = 'home'
            $app.update()
        })
    </script>
</home>

<page1>
    <section class="section">
    	<div class="container">

            <div class="heading">
                <h1 class="title">Page</h1>
                <h2 class="subtitle">n°1</h2>
            </div>

		</div>
    </section>
    
    <script>
        this.on('route', function() {
            $app._page = 'page1'
            $app.update()
        })
    </script>
</page1>

<page2>
    <section class="section">
    	<div class="container">

            <div class="heading">
                <h1 class="title">Page</h1>
                <h2 class="subtitle">n°2</h2>
            </div>

		</div>
    </section>
    
    <script>
        this.on('route', function() {
            $app._page = 'page2'
            $app.update()
        })
    </script>
</page2>



<about>
    <section class="section">
    	<div class="container">

            <div class="heading">
                <h1 class="title">About</h1>
                <h2 class="subtitle">this template</h2>
            </div>
            <hr>

            <div class="content">
                <p> Simple template for made with RiotJS and Bulma. </p>
                <p> Just a foundation for not starting from scratch a future project. </p>
            </div>
            <hr>
		</div>
    </section>
    
    <script>
        this.on('route', function() {
            $app._page = 'about'
            $app.update()
        })
    </script>
</about>

