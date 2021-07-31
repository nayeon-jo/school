using JobKind;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace WpfApp2
{
    /// <summary>
    /// Interest.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Interest : Page
    {
        JobsFactory factory = new JobsFactory();
        
        public Interest()
        {
            InitializeComponent();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            dataGrid.ItemsSource = factory.FindJobs2(textBox.Text);
        }

        public bool CheckBox
        {
            get { return (bool)GetValue(IsCheckBoxCheckedProperty); }
            set { SetValue(IsCheckBoxCheckedProperty, value); }
        }

        // Using a DependencyProperty as the backing store for 
        //IsCheckBoxChecked.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsCheckBoxCheckedProperty =
            DependencyProperty.Register("IsCheckBoxChecked", typeof(bool),
            typeof(Interest), new UIPropertyMetadata(false));

    }
}
