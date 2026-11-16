declare module '@apiverve/imagetopdf' {
  export interface imagetopdfOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface imagetopdfResponse {
    status: string;
    error: string | null;
    data: ImagetoPDFData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface ImagetoPDFData {
      pdfName:     null | string;
      imageCount:  number | null;
      pageCount:   number | null;
      pageSize:    null | string;
      orientation: null | string;
      margin:      number | null;
      quality:     null;
      size:        number | null;
      expires:     number | null;
      downloadURL: null | string;
  }

  export default class imagetopdfWrapper {
    constructor(options: imagetopdfOptions);

    execute(callback: (error: any, data: imagetopdfResponse | null) => void): Promise<imagetopdfResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: imagetopdfResponse | null) => void): Promise<imagetopdfResponse>;
    execute(query?: Record<string, any>): Promise<imagetopdfResponse>;
  }
}
