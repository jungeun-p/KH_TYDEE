package com.api.vision;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.TextAnnotation;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.protobuf.ByteString;

public class VisionTest {
	/*
	 * For full list of available annotations, see http://g.co/cloud/vision/docs
	 * 기본적인 text detecting 기능만을 사용했으므로
	 * 코드는 google vision ai api의 예제 코드와 다른 게 없다
	 * 
	 * 1. https://console.cloud.google.com/home/ 에서 프로젝트를 생성한 후, 라이브러리를 추가
	 * 2. IAM및 관리자 > 서비스 계정 > 해당 프로젝트 키 만들기
	 * 3. 생성된 서비스키에 해당하는 JSON 파일을 통해 인증 받기
	 * 4. Eclipse에서 Run As > Run Configuration... > Environmnet >
	 *    Add > key : GOOGLE_APPLICATION_CREDENTIALS / value : ${project_loc}\(이하 JSON 파일 저장된 주소)
	 * 5. google vision api에 나와있는 예제 실행
	 * 
	 * 보다 자세한 내용은 검색해보는 것을 추천하는 바임
	 */
	public static String detectDocumentText(String filePath) throws IOException {
		  List<AnnotateImageRequest> requests = new ArrayList<>();

		  ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		  Image img = Image.newBuilder().setContent(imgBytes).build();
		  Feature feat = Feature.newBuilder().setType(Type.DOCUMENT_TEXT_DETECTION).build();
		  /*
		   *  TEXT_DETECTION과 DOCUMENT_TEXT_DETECTION의 차이는
		   *  Vision API 안내 가이드 - 광학 문자 인식(OCR) - 이미지의 텍스트 감지에 기재된 내용이나 첨부하자면
		   *  전자는 임의의 이미지에서 텍스트를 감지하여 추출하는 것이고
		   *  후자는 밀집된 텍스트와 문서에 최적화되어
		   *  페이지, 블록, 단락, 단어, 줄바꿈 정보를 포함하여
		   *  JSON 형식으로 텍스트를 감지, 추출한다
		   */
		  
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
		      annotation = res.getFullTextAnnotation();
		      // 페이지나 블록, 문단, 단어, 글자 단위의 인식이 필요할 경우
		      // 여기서부터 for문을 돌려 얻을 수 있다
		      // ex) for (Page page : annotation.getPagesList()) { ...
		      // AnnotateImageResponse의 메소드들 : getPagesList(), getParagraphsList(), getWordsList(), getSymbolsList()
		    }
		  }
		  return annotation.getText();
		}
}
