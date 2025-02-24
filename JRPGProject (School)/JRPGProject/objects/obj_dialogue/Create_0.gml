
// Create key variables
messageContents = [ "Default message", "second default mesaGGGGe" ]; // Array of strings for the messages to be displayed
messageSpeaker	= [ undefined, "Rosette" ]; // The individuals speaking for each messsage
messageEmote	= [ undefined, undefined ]; // The speaker's emotion in each message

messageProgress = 0; // Which message of the current dialogue is being displayed
messageLength	= 0; // Length of the current message
typerProgress	= 0; // How many characters of the current message have been typed out.
typerDelay		= 0; // Used to slow the typer tf down. chill bro

emoteWidth = 0; // Width of the speaker portrait. 0 if none

global.isDialogue = true;
