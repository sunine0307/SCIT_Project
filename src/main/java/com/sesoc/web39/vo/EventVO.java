package com.sesoc.web39.vo;

import lombok.Data;

@Data
public class EventVO {
    private int event_id;
    private String member_id;
    private String event_title;
    private String event_start;
    private String event_end;
    private String event_type;
    private String event_description;
    private String event_backgroundColor;
    private String event_textColor;      
}
