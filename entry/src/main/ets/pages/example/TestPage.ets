// Import necessary modules
// import { CalendarPickerDialog, CalendarDialogOptions } from '@ohos/arkui';

@Entry
@Component
struct CalendarPickerExample {
  // State variable to hold the selected date
  @State selectedDate: string = '';

  build() {
    Column() {
      Text('Selected Date: ' + this.selectedDate)
        .fontSize(24)
        .padding(30);

      Button('Pick a Date')
        .onClick(() => {
          // Define options for the calendar picker dialog
          const options: CalendarDialogOptions = {
            onAccept: (value: Date) => {
              // Update the state with the selected date
              this.selectedDate = `${value.getFullYear()}-${value.getMonth() + 1}-${value.getDate()}`;
            },
            onCancel: () => console.log('User cancelled the selection'),
            onChange: (value: Date) => console.log('Current selected date:', value),
            backgroundColor: '#ffffff', // Optional: Set background color
            acceptButtonStyle: { primary: true }, // Optional: Customize accept button style
          };

          // Show the calendar picker dialog
          CalendarPickerDialog.show(options);
        })
        .margin({ top: 20 });
    }
  }
}