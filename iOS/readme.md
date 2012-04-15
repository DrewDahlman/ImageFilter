<b>ImageFilter</b>

ImageFilter is an easy to use phonegap/Cordova plugin that allows you to apply filters to images and save them out as hi-res versions.

Read more here http://www.drewdahlman.com/meusLabs/?p=138

<b>To USE:<b><br>
<pre>
plugins.ImageFilter.FILTER_NAME(
	successCallback{
	image:imageURI,
	save:'false' // TRUE IF SAVE
});
</pre>

<br>NOTES:</b><br>
- This plugin requires iOS 5+

<b>UPDATES</b><br>
- Addressed Image caching issue. ( thanks to zsprawl )

<b>AVAILABLE CORE IMAGE FILTERS</b><br>
<pre>
	CIAdditionCompositing
	CIAffineTransform
	CICheckerboardGenerator
	CIColorBlendMode
	CIColorBurnBlendMode
	CIColorControls
	CIColorCube
	CIColorDodgeBlendMode
	CIColorInvert
	CIColorMatrix
	CIColorMonochrome
	CIConstantColorGenerator
	CICrop
	CIDarkenBlendMode
	CIDifferenceBlendMode
	CIExclusionBlendMode
	CIExposureAdjust
	CIFalseColor
	CIGammaAdjust
	CIGaussianGradient
	CIHardLightBlendMode
	CIHighlightShadowAdjust
	CIHueAdjust
	CIHueBlendMode
	CILightenBlendMode
	CILinearGradient
	CILuminosityBlendMode
	CIMaximumCompositing
	CIMinimumCompositing
	CIMultiplyBlendMode
	CIMultiplyCompositing
	CIOverlayBlendMode
	CIRadialGradient
	CISaturationBlendMode
	CIScreenBlendMode
	CISepiaTone
	CISoftLightBlendMode
	CISourceAtopCompositing
	CISourceInCompositing
	CISourceOutCompositing
	CISourceOverCompositing
	CIStraightenFilter
	CIStripesGenerator
	CITemperatureAndTint
	CIToneCurve
	CIVibrance
	CIVignette
	CIWhitePointAdjust
</pre>

