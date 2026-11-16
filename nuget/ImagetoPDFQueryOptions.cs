using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.ImagetoPDF
{
    /// <summary>
    /// Query options for the Image to PDF API
    /// </summary>
    public class ImagetoPDFQueryOptions
    {
        /// <summary>
        /// An image file (upload one or more as multipart files, up to 20), base64 image data, or a public image URL
        /// </summary>
        [JsonProperty("image")]
        public string Image { get; set; }

        /// <summary>
        /// A JSON array of public image URLs, added in order after image. Up to 20 images per call in all
        /// </summary>
        [JsonProperty("urls")]
        public List<string>? Urls { get; set; }

        /// <summary>
        /// Page size: fit makes each page the size of its image; a4, letter and legal fit the image inside the margins
        /// </summary>
        [JsonProperty("pageSize")]
        public string PageSize { get; set; }

        /// <summary>
        /// Page orientation for a4, letter and legal; auto turns each page to match its image. Ignored for fit
        /// </summary>
        [JsonProperty("orientation")]
        public string Orientation { get; set; }

        /// <summary>
        /// Margin around each image in millimetres, from 0 to 50
        /// </summary>
        [JsonProperty("margin")]
        public double? Margin { get; set; }

        /// <summary>
        /// Re-compress every image as JPG at this quality (1-100) to make the PDF smaller. Omit to keep JPG and PNG images unchanged
        /// </summary>
        [JsonProperty("quality")]
        public int? Quality { get; set; }
    }
}
