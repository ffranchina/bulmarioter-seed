# To use this makefile you need to have this binaries installed:
# - sassc
# - nodejs
# - npm

SRC=./src
SRCNODE=./node_modules
DEST=./dist
DESTJS=$(DEST)/js
DESTCSS=$(DEST)/css

default: all

clean:
	rm -rf $(SRCNODE)
	rm -rf $(DEST)
	rm -f $(SRC)/js/riot_tags.js
	rm -f $(SRC)/css/main.css

all: clean dep app

dep:
	npm install riot@3.4.0
	npm install riot-cli
	npm install riot-route
	npm install zepto
	npm install bulma@0.3.2
	npm install font-awesome

	mkdir $(DEST)
	mkdir -p $(DESTJS) $(DESTCSS)

app: $(SRC) $(DEST)
	nodejs $(SRCNODE)/riot-cli/lib/index.js $(SRC)/tags $(SRC)/js/riot_tags.js

	echo "'use strict'" > $(DESTJS)/app.js
	cat $(SRC)/js/riot_tags.js $(SRC)/js/main.js >> $(DESTJS)/app.js

	cat $(SRCNODE)/riot/riot.min.js $(SRCNODE)/riot-route/dist/route+tag.min.js $(SRCNODE)/zepto/dist/zepto.min.js >> $(DESTJS)/libs.js
	
	sassc -I $(SRCNODE) $(SRC)/css/main.scss $(SRC)/css/main.css
	cat $(SRC)/css/main.css $(SRCNODE)/font-awesome/css/font-awesome.min.css >> $(DESTCSS)/app.css
	cp -r $(SRCNODE)/font-awesome/fonts $(DEST)

	cp -r $(SRC)/res $(DEST)

	cp $(SRC)/index.html $(DEST)


run:
	cd $(DEST);	python3 -m http.server; cd ..
