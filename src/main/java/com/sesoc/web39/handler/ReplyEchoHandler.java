package com.sesoc.web39.handler;

import java.util.ArrayList;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {
	//소켓세션을 전부다 담아서 한꺼번에 이벤트 메세지를 뿌린다
	ArrayList<WebSocketSession> sessions =new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished:" + session);
		sessions.add(session);
	};
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage:" + session+ ":" + message);
		String senderId = session.getId();
		for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId + ":"+message.getPayload()));
		}
	};

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed:" + session+ ":" + status); 
		sessions.remove(session);

	};



}
