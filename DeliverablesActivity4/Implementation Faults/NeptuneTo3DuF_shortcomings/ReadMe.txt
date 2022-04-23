I used an example mint file from GitHub to test whether or not the JSON output files from Neptune/Fluigi can be drag and dropped into 3DuF....
It did not work and after further digging, when comparing the Fluigi JSON file to a working JSON file which was made in 3DuF and able to be
drag and dropped, it is evident that the Fluigi JSON is missing the ID numbers present for the components, as well as missing the "params" 
class which holds the yspan, xspan, and the valveMap and valueTypeMap objects.

This held true, for my SPLoC design, and the given JSON output files from Neptune, they did not work when dragging and dropping into 3DuF.