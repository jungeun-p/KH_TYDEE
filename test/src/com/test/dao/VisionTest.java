package com.test.dao;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Block;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.Page;
import com.google.cloud.vision.v1.Paragraph;
import com.google.cloud.vision.v1.Symbol;
import com.google.cloud.vision.v1.TextAnnotation;
import com.google.cloud.vision.v1.Word;
import com.google.protobuf.ByteString;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class VisionTest {

	public static String detectDocumentText(String filePath) throws IOException {
		  List<AnnotateImageRequest> requests = new ArrayList<>();

		  ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		  Image img = Image.newBuilder().setContent(imgBytes).build();
		  Feature feat = Feature.newBuilder().setType(Type.DOCUMENT_TEXT_DETECTION).build();
		  AnnotateImageRequest request =
		      AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		  requests.add(request);
	      TextAnnotation annotation = null;
		  
		  StringBuffer pageText = new StringBuffer();
		  try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
		    BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
		    List<AnnotateImageResponse> responses = response.getResponsesList();
		    client.close();

		    for (AnnotateImageResponse res : responses) {
		      if (res.hasError()) {
		        System.out.format("Error: %s%n", res.getError().getMessage());
		        return "error!";
		      }
		      // For full list of available annotations, see http://g.co/cloud/vision/docs
		      annotation = res.getFullTextAnnotation();
		      /*
		      for (Page page : annotation.getPagesList()) {
		        for (Block block : page.getBlocksList()) {
		          StringBuffer blockText = new StringBuffer();
		          for (Paragraph para : block.getParagraphsList()) {
		            StringBuffer paraText = new StringBuffer();
		            for (Word word : para.getWordsList()) {
		              StringBuffer wordText = new StringBuffer();
		              for (Symbol symbol : word.getSymbolsList()) {
		                wordText.append(symbol.getText());
//		                System.out.format("Symbol text: %s (confidence: %f)%n", symbol.getText(), symbol.getConfidence());
		              }
//		              System.out.format("Word text: %s (confidence: %f)%n%n", wordText, word.getConfidence());
//		              paraText.append(" ").append(wordText);
		              paraText.append(wordText);
		            }
		            // Output Example using Paragraph:
//		            System.out.println("%nParagraph: %n" + paraText);
//		            System.out.format("Paragraph Confidence: %f%n", para.getConfidence());
		            blockText.append(paraText);
		          }
		          pageText.append(blockText);
		        }
		      }
//		      System.out.println("%nComplete annotation:");
//		      System.out.println(annotation.getText());
		       */
		    }
		  }
//		  return pageText.toString();
		  return annotation.getText();
		}
	
}
