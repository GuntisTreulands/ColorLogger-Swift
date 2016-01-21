# ColorLogger-Swift
Meant to give user almost identical log out capabilities on Swift as (https://github.com/robbiehanson/XcodeColors) for Objective-C 

![PreviewImage](https://github.com/GuntisTreulands/ColorLogger-Swift/blob/master/screenshot.png?raw=true)


Usage
===
	ColorLogger log out put will work, in case you have added -D DEBUG flag in Other Swift Flags. (So, in case of app release - all logs would be silenced).

![PreviewImage](https://github.com/GuntisTreulands/ColorLogger-Swift/blob/master/swiftflags.png?raw=true)

	
	Example usage:

	Log()
	LogRed()
	LogBlue()
	LogOrange()


	Log()
	Log("text")
	Log(object)
	Log("text count \(5) and object \(label)")
	Log(("text", "bext", 5, string))
	
	
	(If you need, you can rename / add new / remove old functions. Colors can also be added more.)

License
===

	This code was created by combining multiple solutions found on github and 
	StackOverflow to create a solution that would best fit my needs. 
	Use it as you want/need, no need to add license for it!
