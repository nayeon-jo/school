using JobKind;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp2
{
    /// <summary>
    /// Ability.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Ability : Page
    {
        JobsFactory factory = new JobsFactory();
        
        public Ability()
        {
            InitializeComponent();
        }
        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            dataGrid.ItemsSource = factory.FindJobs1(textBox.Text);
        }

        private void comboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            textBox.Text = comboBox.SelectedItem.ToString();
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
            typeof(Ability), new UIPropertyMetadata(false));
    }
}
