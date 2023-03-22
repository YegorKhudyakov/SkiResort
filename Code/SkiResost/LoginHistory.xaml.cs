﻿using System;
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
    /// Interaction logic for LoginHistory.xaml
    /// </summary>
    public partial class LoginHistory : Page
    {
        public LoginHistory()
        {
            InitializeComponent();
            DGridLoginHistory.ItemsSource = SkiResortEntities.GetContext().Workers.ToList();
        }
    }
}
