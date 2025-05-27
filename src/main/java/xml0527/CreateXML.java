package xml0527;

import org.jdom2.Document;
import org.jdom2.Element;

public class CreateXML {

	public void createXML()	{
		
		//1.XML 문서객체 생성
		Document doc = new Document();
		
		//2.최상위 부모노드 생성
		Element rootNode = new Element("root"); 
		
		//3.자식 노드 생성
		Element msgNode = new Element("msg");
		//자식노드에 값 설정
		System.out.println(msgNode);
		msgNode.setText("안녕하세요");
		System.out.println(msgNode);
		
	}//createXML
	
	public static void main(String[] args) {
		new CreateXML().createXML();
	}//main

}//class
