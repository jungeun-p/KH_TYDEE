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
	 * 코드는 google vision ai api의 예제 코드와 크게 다르지 않다
	 * google의 vision 제품으로는 autoML과 vision ai가 있는데
	 * autoML의 경우에는 이미지 파일을 보이는 그대로 텍스트를 추출해내기 때문에 (사실 불확실함)
	 * 영수증과 같이 다단으로 이루어진 경우, 리턴되는 String값이 뒤죽박죽이다
	 * paragraph와 block 단위로 인식하여 읽어내는 vision ai를 선택하게 된 이유이다
	 * 
	 * 1. https://console.cloud.google.com/home/ 에서 프로젝트를 생성한 후, 라이브러리를 추가
	 * 2. IAM및 관리자 > 서비스 계정 > 해당 프로젝트 키 만들기
	 * 3. 생성된 서비스키에 해당하는 JSON 파일을 통해 인증 받기
	 * 4. Eclipse에서 Run As > Run Configuration... > Environmnet >
	 *    Add > key : GOOGLE_APPLICATION_CREDENTIALS / value : ${project_loc}\(이하 JSON 파일 저장된 주소)
	 * 5. google vision api에 나와있는 예제 실행
	 * 
	 * 자세한 내용은 검색해보는 것을 추천합니다
	 */
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
		      annotation = res.getFullTextAnnotation();
		    }
		  }
		  return annotation.getText();
		}
}
