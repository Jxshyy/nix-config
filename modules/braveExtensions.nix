{ ... }:

{
  environment.etc."brave/policies/managed/extensions.json".text = builtins.toJSON {
    ExtensionInstallForcelist = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa;https://clients2.google.com/service/update2/crx"
      "fbdlhcdkmaleonkhckokleapdgilbcph;https://clients2.google.com/service/update2/crx"
    ];
    HomepageLocation = "https://homepage.cowenjones.co.uk";
    HomepageIsNewTabPage = false;
    ShowHomeButton = true;
    NewTabPageLocation = "https://homepage.cowenjones.co.uk";
  };
}
