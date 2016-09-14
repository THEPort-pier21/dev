<html lang="en">
    <head>
        <title>W6 analysis</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        

    </head>

    <body >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 header" id="header">
                        <h2 id="site-name">The Aid Security </h2>
                        <h2 id="site-name">Monthly News Brief </h2>
                    </div>
                    <div class="col-sm-4 header" id="header">
                        <h3 id="date-name"/>
                        <h3 id="year-name"/>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                         <div>
                        <div class="row" id="report">            
                                    <script>
                                        var currentRegion = null;
                                        var currentCountry = null;
                                        var currentDate = null;
                                        addRecursiveTable = function(newEntity, oldEntity)
                                        {
                                            var output = "";
                                            
                                            return output;
 
                                        }
                                        window.onload = function () {
                                            var events = ${events};
                                            var month = new Date("${month}");
                                            console.log(month);
                                            document.getElementById("date-name").innerHTML = month.toLocaleString("en-us", { month: "long" })
                                            document.getElementById("year-name").innerHTML = 1900 + month.getYear();
                                            console.log(events);
                                            var sourses = ${sourses};
                                            console.log(sourses);
                                            var i;
                                            var output = "";
                                            document.getElementById("report").innerHTML = output + "xyz";
                                            console.log(events.length);

                                            for (i = 0; i < events.length; i++) 
                                            {
                                                console.log(events[i]);
                                                if (events[i].region !== currentRegion)
                                                {
                                                    if (currentRegion !== null)
                                                    {
                                                        output += "</div></div>";                        
                                                    }
                                                    output +=    "<div class=\"row\"><div class=\"col-xs-3\">" + events[i].region + "</div><div class=\"col-xs-9\">";
                                                    currentRegion = events[i].region;                                                 
                                                }
                                                if (events[i].country !== currentCountry)
                                                {
                                                    if (currentCountry !== null)
                                                    {
                                                        output += "</div></div></div></div>";
                         
                                                    }
                                                    output += "<div class=\"row\"><div class=\"col-xs-3\">" + events[i].country + "</div><div class=\"col-xs-9\">";
                                                    currentCountry = events[i].country;
                                                }
                                                if (events[i].date !== currentDate)
                                                {
                                                    if (currentDate !== null)
                                                    {
                                                        output += "</div></div>";
                         
                                                    }
                                                    output += "<div class=\"row\"><div class=\"col-xs-3\">" + events[i].date + "</div><div class=\"col-xs-9\">";
                                                    currentDate = events[i].date;
                                                }
                                                output += "<div class=\"row\">" + events[i].description + "Sourses: " + sourses[i].join() + "</div>";
                                                currentCountry = events[i].country;
                                            }
                                            output += "</div></div></div></div></div></div>";

                                            document.getElementById("report").innerHTML = output;

                                        }
                                    </script>
							            
                            </div>
                        </div>
                    </div>
        
    </body>
</html>
