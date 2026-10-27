
//Open images
path = File.openDialog("Select a fundus image");
open(path);

dir = File.getParent(path);
color_name = File.getName(path);
dot = lastIndexOf(color_name, ".");
base = substring(color_name, 0, dot);

//Clahe Contrast enhancement
run("Enhance Local Contrast (CLAHE)", "blocksize=127 histogram=256 maximum=9 mask=*None*");


//Open black and white image
bw_name =base + "_bw.tif"
bwPath = dir + File.separator + bw_name;
run("Bio-Formats Importer",
    "open=[" + bwPath + "] color_mode=Default quiet rois_import=[ROI manager] view=[Standard ImageJ] stack_order=Default");

//Rescale and invert binary image
run("Multiply...", "value=255");
run("Invert");

//overlay
run("Add Image...", "image="+color_name+" x=0 y=0 opacity=30");