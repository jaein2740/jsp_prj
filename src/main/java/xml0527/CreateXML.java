package xml0527;

import org.jdom2.Document;

public class CreateXML {

	public void createXML()	{
		
		//1.XML 문서객체 생성
		Document doc = new Document();
		
		System.out.println(doc);
		
	}//createXML
	
	public static void main(String[] args) {
		new CreateXML().createXML();
	}//main

}//class
