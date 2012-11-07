<html>
<head>
</head>
<body>
<h2>Resources</h2>
<ul>
<li>GateOne on GitHub: https://github.com/liftoff/GateOne</li>
<li>Official Documentation: http://liftoff.github.com/GateOne/</li>
<li>Licensing: http://liftoff.github.com/GateOne/About/index.html#licensing</li>
<li>GateOne with Supervisor (blog post): http://blog.yourtech.us/2012/08/yesterday-i-setup-gateone-to-run-as-non.html</li>
</ul>
<h2>Assumptions</h2>
<ul>
<li>Raspbian .img written to SD card; Raspbian fully configured and running in Raspi.</li>
<li>Access to internet</li>
<li>Unzipped script or downloaded script with git clone
<li>Script executed on Raspi running Raspbian.
</ul>
<h2>What it does with all that privelege</h2>
<ol>
<li>bash powered; verbose output
<li>Checks that the script is run with root privs; exit with error if not;
<li>Updates software source list info (function)
<li>Installs dependencies with apt-get (forced yes) (function)
<li>Install dependencies with pip install (function)
<li>Downloads the .deb from github for GateOne
<li>Installs deb with dpkg (installs to /opt)
</ol>
<h2>Usage</h2>
Script should be executeable. sudo /path/to/script.sh should start it running.
<h2>Still to Do</h2>
<ul><li>Heredoc write server config with values defined in script. Hopefully.
<li>Init on startup from /etc/init.d - see resources.
</ul>
</body>
</html>
