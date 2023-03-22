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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SkiResort
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void ComboLogin_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTextBox.Text;
            string password = PasswordBox.Password;

            var context = SkiResortEntities.GetContext();

            var user = context.Workers.FirstOrDefault(w => w.Login == login && w.Passwords == password);
            string WorkersPosition = user.WorkersPositions.Name;

            if (user != null)
            {
                MessageTextBlock.Text = "Успешный вход";
                WorkWindow workWindow = new WorkWindow(WorkersPosition);
                workWindow.Show();
                this.Close();
            }
            else
            {
                MessageTextBlock.Text = "Неверный логин или пароль";
            }
        }
    }
}
