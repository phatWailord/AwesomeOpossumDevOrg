import { LightningElement, wire } from 'lwc';

import generateOnePageResume from '@salesforce/apex/ResumePDFHelper.generateOnePagePDF'


export default class ResumeDownloadLatest extends LightningElement {

  @wire(generateOnePageResume) onePageResume;
  renderedCallback() {
    console.log('made it to render callback');
    var link = document.createElement("a");
    link.href = window.URL.createObjectURL(onePageResume.data);
    var fileName = "One Page Resume";
    link.download = fileName;
    link.click();
    

    
}

async createPdf() {
        console.log('attempting to create pdf');
        const pdfDoc = await PDFLib.PDFDocument.create();
        const timesRomanFont = await pdfDoc.embedFont(
          PDFLib.StandardFonts.TimesRoman
        );
    
        const page = pdfDoc.addPage();
        const { width, height } = page.getSize();
        const fontSize = 30;
        page.drawText("Generating Resume Plz Come Back Later!", {
          x: 50,
          y: height - 4 * fontSize,
          size: fontSize,
          font: timesRomanFont,
          color: PDFLib.rgb(0, 0.53, 0.71)
        });
        page.drawText("put some text up here", {
          x: 0,
          y: height-12,
          size: 12,
          font: timesRomanFont,
          color: PDFLib.rgb(0, 0.53, 0.71)
        });
    
        const pdfBytes = await pdfDoc.save();
        this.saveByteArray("My PDF", pdfBytes);
      }


      saveByteArray(pdfName, byte) {
        var blob = new Blob([byte], { type: "application/pdf" });
        var link = document.createElement("a");
        link.href = window.URL.createObjectURL(blob);
        var fileName = pdfName;
        link.download = fileName;
        link.click();
      }
    

    
     
      



}