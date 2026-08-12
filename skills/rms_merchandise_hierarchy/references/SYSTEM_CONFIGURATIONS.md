# RMS Merchandise Hierarchy - System Options & Implementation Configurations

## Excerpts from Implementation Guide (System Options & Setup)

#### **Notification Groups and Roles**


The Notification Groups and Roles table consists of all the roles associated with a
notification type master record. If there are no records associated with the notification
type then a "no data to display" message appears in the Notification Groups and Roles
table when the notification type is selected in the Notification Types table.


**Create/Add Notification Group**
The Create action is enabled at all times when a notification type is selected and allows
you to create a new notification group associated with the selected notification type.


**Create a Notification Group**


**1.** From the Actions menu, select Create (or Add Notification Groups). The Create
Notification Group dialog is displayed.


_**Figure 3–18 Create Notification Group Dialog**_


**2.** Enter a name and (optionally) a description of the group.


**3.** Click OK to create the new notification group.


**3-16** Oracle® Retail Merchandising Implementation Guide


Manage Notifications


**Add Job Role**

Once a notification group is created, you can add job roles that apply to the selected

group.


**Add a Job Role**


**1.** From the Actions menu, select Add job Role. The Add Job Role dialog is
displayed.


_**Figure 3–19 Create Job Role Dialog**_


**2.** Enter a name for the job role.


**3.** Click OK to create the new job role or OK and Add Another to create additional
job roles.


Upon clicking OK or OK and Add Another, the New name is validated. The
validation checks for a valid name in the enterprise security solution of the retailer.
If it finds a match, then it allows the user to proceed. If the name is not valid, an
error is displayed.


**Edit**

The Edit action is enabled when a notification group or job role is selected. The Edit
action is used to modify the name and description of an existing notification group or
job role.


**Edit a Notification Group**


**1.** Select the notification group or job role you want to edit.


**2.** From the Actions menu, select Edit. The Edit Notification Group (or Edit Job Role)
dialog is displayed.


_**Figure 3–20 Edit Notification Group Dialog**_


Oracle Retail Application Administration Console **3-17**


Manage Notifications


**3.** Modify the notification group or job role attributes and click OK.


Upon clicking OK, the New name is validated. The validation checks for a valid
name in the enterprise security solution of the retailer. If it finds a match, then it
allows the user to proceed. If the name is not valid, an error is displayed.


**Delete**

The Delete action is enabled when you select a notification group or job role that can
be deleted from the database.


Deleting a notification type removes the notification type and all of the notification
type’s associated roles and groups. Any past notifications are also removed in order to
maintain data integrity.


**Delete a Notification Type**


**1.** Select the notification type you want to delete.


**2.** From the Actions menu, select Delete. The Confirm dialog is displayed.


_**Figure 3–21 Delete Notification Group Confirmation Dialog**_


**3.** Click OK to delete the selected notification group or job role.


**Export to Excel**
The Export to Excel action is enabled whenever you have the Manage Notifications
window open. This action allows you to export the Notification Groups and Roles list
to a Microsoft Excel spreadsheet.


**3-18** Oracle® Retail Merchandising Implementation Guide
