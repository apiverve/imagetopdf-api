/*
 * Image to PDF API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Image to PDF API.
 * API Documentation: https://docs.apiverve.com/ref/imagetopdf
 */

using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Linq;

namespace APIVerve.Examples
{
    class ImagetoPDFExample
    {
        private static readonly string API_KEY = Environment.GetEnvironmentVariable("APIVERVE_API_KEY") ?? "YOUR_API_KEY_HERE";
        private static readonly string API_URL = "https://api.apiverve.com/v1/imagetopdf";

        /// <summary>
        /// Make a POST request to the Image to PDF API
        /// </summary>
        static async Task<JsonDocument> CallImagetoPDFAPI()
        {
            try
            {
                using var client = new HttpClient();
                client.DefaultRequestHeaders.Add("x-api-key", API_KEY);

                // Request body
                var requestBody &#x3D; new { urls &#x3D; https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w&#x3D;1200,https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w&#x3D;1200, pageSize &#x3D; &quot;a4&quot;, orientation &#x3D; &quot;auto&quot;, margin &#x3D; 10 };

                var jsonContent = JsonSerializer.Serialize(requestBody);
                var content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

                var response = await client.PostAsync(API_URL, content);

                // Check if response is successful
                response.EnsureSuccessStatusCode();

                var responseBody = await response.Content.ReadAsStringAsync();
                var data = JsonDocument.Parse(responseBody);

                // Check API response status
                if (data.RootElement.GetProperty("status").GetString() == "ok")
                {
                    Console.WriteLine("✓ Success!");
                    Console.WriteLine("Response data: " + data.RootElement.GetProperty("data"));
                    return data;
                }
                else
                {
                    var error = data.RootElement.TryGetProperty("error", out var errorProp)
                        ? errorProp.GetString()
                        : "Unknown error";
                    Console.WriteLine($"✗ API Error: {error}");
                    return null;
                }
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine($"✗ Request failed: {e.Message}");
                return null;
            }
        }

        static async Task Main(string[] args)
        {
            Console.WriteLine("📤 Calling Image to PDF API...\n");

            var result = await CallImagetoPDFAPI();

            if (result != null)
            {
                Console.WriteLine("\n📊 Final Result:");
                Console.WriteLine(result.RootElement.GetProperty("data"));
            }
            else
            {
                Console.WriteLine("\n✗ API call failed");
            }
        }
    }
}
