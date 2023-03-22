using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace SkiResort
{
    /// <summary>
    /// Interaction logic for WorkWindow.xaml
    /// </summary>
    public partial class WorkWindow : Window
    {
        private string _userPosition;

        public WorkWindow(string workerPosition)
        {
            InitializeComponent();
            _userPosition = workerPosition;
            UpdateVisibility();
            MainFrame.Navigate(new LandPage());
            Manager.MainFrame = MainFrame;
        }

        private void UpdateVisibility()
        {
            switch (_userPosition)
            {
                case "Продавец":
                    BtnCreateorder.Visibility = Visibility.Visible;
                    BtnTakeProducts.Visibility = Visibility.Collapsed;
                    BtnCreateReport.Visibility = Visibility.Collapsed;
                    BtnLoginHistory.Visibility = Visibility.Collapsed;
                    break;

                case "Старший смены":
                    BtnCreateorder.Visibility = Visibility.Visible;
                    BtnTakeProducts.Visibility = Visibility.Visible;
                    BtnCreateReport.Visibility = Visibility.Collapsed;
                    BtnLoginHistory.Visibility = Visibility.Collapsed;
                    break;

                case "Администратор":
                    BtnCreateorder.Visibility = Visibility.Collapsed;
                    BtnTakeProducts.Visibility = Visibility.Collapsed;
                    BtnCreateReport.Visibility = Visibility.Visible;
                    BtnLoginHistory.Visibility = Visibility.Visible;
                    break;

                default:
                    BtnCreateorder.Visibility = Visibility.Collapsed;
                    BtnTakeProducts.Visibility = Visibility.Collapsed;
                    BtnCreateReport.Visibility = Visibility.Collapsed;
                    BtnLoginHistory.Visibility = Visibility.Collapsed;
                    break;
            }
        }

        private void BtnCreateorder_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnTakeProducts_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnLoginHistory_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new LoginHistory());
        }

        private void BtnCreateReport_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
                BtnBack.Visibility = Visibility.Visible;
            else
                BtnBack.Visibility = Visibility.Hidden;
        }
    }
}
