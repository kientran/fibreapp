
## COPY your Facebook Birthday Export feed here.

<div id='urlform'>
<form action='/form' method='post'>
<input type='text' id='url' name='url' /><br />
<input type='submit' value='Convert'>	
</form>
</div>

## WHAT is this app
This application takes Facebook's birthday iCal export address and corrects birthdays from 24 hour events to an all day event.

## WHEN would you use this
If you like to keep track of your friend's birthdays, Facebook is a great way to do it. With this app, you can take that listing of birthdays and display it on any iCal compatible calendar.

## WHERE do you use the app
You can use this on any calendar application that accepts an iCal subscription as a source, such as Apple iCal, Outlook, or Google Calendar.

## HOW do you use it

SCREEN CAST 

Simply go to your <a href='http://www.facebook.com/?sk=bd' target='_new'>Facebook Birthday list</a>.

Scroll to the bottom of the page and click "Export Birthdays."  This will popup a box with a webcal link.

Copy this webcal link.

Paste the webcal link into the field above and click convert.

Copy the resultant link

Subscribe to the link in your favorite Calendar Application.

SCREENSHOT GOOGLE

SCREENSHOT  iCAL

SCREENSHOT OUTLOOK

## WHY did I write this
I rely on Facebook to help remind me about my friend's birthdays. I also am completely dependent on my Google Calendar to plan my life, and as such, I want to have this birthday information in my calendar.

With the default Facebook iCal export, there is an issue where the exported events are actualy 24 hour events, starting at midnight. This causes my calendar to fill those days with an event that lasts all day long, causing clutter and pushing aside other appointments I have for the day.

The iCalendar format provides "all-day" events which mean the event does not have a start or end time, but rather appears similar to a "holiday" on your calendar.  This is more appropriate for things such as birthdays and anniversaries.

I also solve the issue where Facebook's feed exports birthdays starting from the current day going forward.  For example, if today is June 1st, 2011, Facebook will list everyone's birthdays starting from June 1st, 2011. Anyone person's birthday prior to June 1st will be considered for next year, May 31, 2012 for example. As such,  your calendar will remove past birthdays as soon as it syncs again.

I solve this issue by subtracting one year from the events that Facebook creates, allow you to view birthdays you've missed up to one year ago.

Since Facebook has ignored my bug reports and has a track record that makes it very unlikely that they will fix the issue any time soon, I have taken it upon myself to correct the issue.

## HOW does this work?
The app fetches your Facebook Birthday iCal export file using your userid and feed key.  

From there, it modifies all the event dates to remove the Time component, turning them into "all-day" events. It also rolls all events back one year so you can see recently past birthdays.

Then it returns the modified iCal feed back for use in any application that supports it

## WHO am I
I am Kien Tran, a web designer, application developer, and Audio/Video technician from Dallas, Texas.

## FAQ:
### Are you storing my Facebook UID and key?
No, this application merely acts as a passthrough converter.  Check out the code and run it yourself if you don't believe me.

### Your code is terrible, you should do it like this.
Feel free to fork and do a merge request.

### How do I make this work with Outook 2011 for Mac?
Outlook 2011 for Mac does not have the ability to directly subscribe to iCal feeds. You must use Apple iCal to subscribe and then sync Outlook 2011 to iCal with SyncServices.
