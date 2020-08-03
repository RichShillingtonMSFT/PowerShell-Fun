# For more information see this link
# https://docs.microsoft.com/en-us/dotnet/api/system.speech.synthesis?view=netframework-4.8

# Give this a path to a text file with the words you want PowerShell to read
$Words = Get-Content 'C:\VoiceTest.txt'

# This adds the speech assembly
Add-Type -AssemblyName System.Speech
$SpeechSynthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer

# This prompts you to select a voice
$Voice = $SpeechSynthesizer.GetInstalledVoices().VoiceInfo | Out-GridView -Title "Please Select a voice." -PassThru
$SpeechSynthesizer.SelectVoice("$($Voice.Name)")

# This part reads the words from the file
$SpeechSynthesizer.Speak("$Words")