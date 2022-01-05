const rootRoute = "/";

const dashboardPageDisplayName = "Dashboard";
const dashboardPageRoute = "/dashboard";

const displayPageDisplayName = "Display";
const displayPageRoute = "/display";

const devicePageDisplayName = "Device";
const devicePageRoute = "/device";

const contentsPageDisplayName = "Contents";
const contentsPageRoute = "/contents";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(dashboardPageDisplayName, dashboardPageRoute),
  MenuItem(displayPageDisplayName, displayPageRoute),
  MenuItem(devicePageDisplayName, devicePageRoute),
  MenuItem(contentsPageDisplayName, contentsPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute), 
];
