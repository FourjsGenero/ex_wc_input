# Minimal sample for Webcomponents emulating a FormField

## Description

Show cases the usage of the gICAPI.onFlushData() and gICAPI.onStateChanged() functions in all clients.

In case the focus was in the webcomponent and the input value was changed by the end user and "showvalue" is triggered then onFlushData()'s purpose is to synchronize the pending new data at client side to the 4GL side via gICAPI.SetData().

If onFlushData() would not exist, one would have to use a webcomponent frontcall to retrieve the changed value (Situation in 3.0) 

Leaving the INPUT causes onStateChanged() being triggered.
The webcomponent frontcall used in this sample is only for debugging purposes to visualize the order of events.
