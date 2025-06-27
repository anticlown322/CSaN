using Microsoft.Extensions.DependencyInjection;
using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Net.Http.Json;
using System.Collections.Generic;
using Microsoft.Maps.MapControl.WPF;


namespace lab4
{
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e is { Source: Border, ChangedButton: MouseButton.Left })
            {
                DragMove();
            }
        }
        private void BtnMinimize_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            Search();
        }

        async Task Search()
        {
            var services = new ServiceCollection();
            services.AddHttpClient();
            var serviceProvider = services.BuildServiceProvider();
            var httpClientFactory = serviceProvider.GetService<IHttpClientFactory>();
            var httpClient = httpClientFactory?.CreateClient();

            const string API_URL = "https://search.censys.io/api/";
            string[] reqParams = { "q=services.port%3D1488", "per_page=100", "virtual_hosts=EXCLUDE", "sort=RELEVANCE" };

            httpClient.DefaultRequestHeaders.Add("accept", "application/json");
            httpClient.DefaultRequestHeaders.Add("Authorization", "Basic NTViNzgyYzItMGRiZi00ZjQxLTk3NTUtZWJmZWQ4MjYxZGRhOmdoVjZpTHczUWEyaXUzVFNyZFdSMlpnQkU3bjFHYk5U");
            string request = API_URL + $"v2/hosts/search?{reqParams[0]}&{reqParams[1]}&{reqParams[2]}&{reqParams[3]}";

            Rootobject response = await httpClient.GetFromJsonAsync<Rootobject>(request);

            int counter = 0;
            if (response != null)
            {
                while (counter < response.result.hits.Length)
                {
                    float latitude = response.result.hits[counter].location.coordinates.latitude;
                    float longtitude = response.result.hits[counter].location.coordinates.longitude;
                    Microsoft.Maps.MapControl.WPF.Location coodinates = new Microsoft.Maps.MapControl.WPF.Location(latitude, longtitude);
                    Pushpin marker = new Pushpin()
                    {
                        Location = coodinates,
                    };
                    mapka.Children.Add(marker);
                    counter++;
                }
            }
        }
    }
}
