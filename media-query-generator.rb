initial_min = 319
initial_max = 1600

def make_htmls(min, max, orientation, mdpr)

	file_name = "test_" + min.to_s + "-" + max.to_s + "_" + orientation.to_s + "_mdpr" + mdpr.to_s + ".html"
	out_file = File.new(file_name, "w")
	out_file.puts('

			<html>
				<head>
				<title>Title</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    		<style type="text/css">
	    	')

	for i in min..max do
		for j in i+1..max do

			out_file.puts( "@media only screen and (min-device-width : " + i.to_s + ") and (max-device-width : " + j.to_s + ") and (orientation : landscape) and (-webkit-min-device-pixel-ratio : 3)  { 
		.div_min" + i.to_s + "_max" + j.to_s + "_" + orientation.to_s + "_mdpr" + mdpr.to_s + " { display:block !important;} 
	}" )
		end
	end

	out_file.puts( '	</style></head><body>')

	for i in min..max do
		for j in i+1..max do
			out_file.puts( '<div style="display:none !important;" class="div_min' + i.to_s + '_max' + j.to_s + '_ls_3">min ' + i.to_s + ", max " + j.to_s + ", l, 3 </div>" )
		end
	end

	out_file.puts( "</body></html>")
	out_file.close

end


make_htmls(initial_min, initial_max, 'landscape', '1')
make_htmls(initial_min, initial_max, 'portrait', '1')
make_htmls(initial_min, initial_max, 'landscape', '2')
make_htmls(initial_min, initial_max, 'portrait', '2')
make_htmls(initial_min, initial_max, 'landscape', '3')
make_htmls(initial_min, initial_max, 'portrait', '3')