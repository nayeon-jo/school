using System;
using System.Collections.Generic;
using System.IO;
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
    /// Calendar.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Calendar : Page
    {
        public Calendar()
        {
            InitializeComponent();
        }

        private void Enter_Click(object sender, RoutedEventArgs e)
        {
            SaveData();
        }

        private void SaveData()
        {           
            if (this.content.Text.Trim() == "")
                return;

            string subDir = "Data";
            Directory.CreateDirectory(subDir);
           
            string Date = this.calendar.SelectedDate.Value.ToShortDateString();

            FileStream newFile = new FileStream(Directory.GetCurrentDirectory() + "\\" + subDir + "\\" + Date, FileMode.Create, FileAccess.Write);

            using (StreamWriter sw = new StreamWriter(newFile))
            {              
                sw.WriteLine(this.content.Text);
            }
        }

        private void calendar_SelectedDatesChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadData();
        }

        private void LoadData()
        {
            string subDir = "Data";
            string Date = this.calendar.SelectedDate.Value.ToShortDateString();

            if (!File.Exists(Directory.GetCurrentDirectory() + "\\" + subDir + "\\" + Date))
            {
                this.content.Text = "";
                return;
            }

            FileStream existingFile = new FileStream(Directory.GetCurrentDirectory() + "\\" + subDir + "\\" + Date, FileMode.Open, FileAccess.Read);

            using (StreamReader sr = new StreamReader(existingFile))
            {
                this.content.Text = sr.ReadToEnd();
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            string subDir = "Data";
            string Date = this.calendar.SelectedDate.Value.ToShortDateString();

            this.content.Text = "";

            if (File.Exists(Directory.GetCurrentDirectory() + "\\" + subDir + "\\" + Date))
            {
                File.Delete(Directory.GetCurrentDirectory() + "\\" + subDir + "\\" + Date);
                return;
            }
        }
    }
}
