# TableViewRefreshControlSample
Sample project to reproduce issue related to UITableView UIRefreshControl and UIAlertController behavior

I am displaying a UIAlertController if I get an error from the loader. Even though I call endRefreshing() on the refreshControl,  it is still not hiding and it is still spinning, and the tableview is still scrolled down from the previous pull

Even if I call endRefreshing() in several places, and I am confirming via print() statements that the refreshControl is in fact NOT refreshing anymore, it still shows as spinning and the tableview is still displaced and doesn't return to its place

# Demo Video
![Demo Video](https://github.com/mdoukmak/TableViewRefreshControlSample/blob/main/preview.gif?raw=true)

