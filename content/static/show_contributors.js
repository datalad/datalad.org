// File path where integrations/extensions/use cases are listed
const contributor_file_path = 'static/github_contributors.json';

// Create VueJS app to load `integrations.json` and allow filtering by name/tag
var app = new Vue({
    el: "#footer-app",
    data: {
        all_contributors: [],
    },
    methods: {
      getJSONblob(file) {
        var app = this;
        var rawFile = new XMLHttpRequest();
        rawFile.onreadystatechange = function () {
            if(rawFile.readyState === 4) {
                if(rawFile.status === 200 || rawFile.status == 0) {
                    var allText = rawFile.responseText;
                    app.all_contributors = JSON.parse(allText);
                } else if (rawFile.status === 404) {
                  router.push({ name: '404'})
                } else {
                  // TODO: figure out what to do here
                }
            }
        }
        rawFile.open("GET", file, false);
        rawFile.send();
      },
    },
    beforeMount(){
      this.getJSONblob(contributor_file_path)
    },
});