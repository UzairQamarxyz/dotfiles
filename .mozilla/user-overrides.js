user_pref("keyword.enabled", true);

user_pref("browser.safebrowsing.downloads.remote.enabled", true);
user_pref("signon.autofillForms", true);
user_pref("browser.startup.page", 1);
user_pref("browser.formfill.enable", true);
user_pref("network.http.referer.XOriginPolicy", 0);

user_pref("privacy.sanitize.sanitizeOnShutdown", false);

user_pref("privacy.clearOnShutdown.cache", false);     // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.downloads", false); // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.formdata", false);  // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.history", false);   // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.sessions", false);  // [DEFAULT: true]

user_pref("privacy.cpd.cache", false);    // [DEFAULT: true]
user_pref("privacy.cpd.formdata", false); // [DEFAULT: true]
user_pref("privacy.cpd.history", false);  // [DEFAULT: true]
user_pref("privacy.cpd.sessions", false); // [DEFAULT: true]
user_pref("privacy.cpd.offlineApps", false); // [DEFAULT: false]
user_pref("privacy.cpd.cookies", false);

user_pref("privacy.resistFingerprinting.letterboxing", false); // [HIDDEN PREF]

user_pref("security.cert_pinning.enforcement_level", 2);
