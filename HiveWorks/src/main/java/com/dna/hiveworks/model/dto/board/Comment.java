package com.dna.hiveworks.model.dto.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Comment {
    private int commentNo;
    private int commentBoardNo;
    private int reCommentNo;
    private String commentContent;
    private int creater;
    private Date createDate;
    private int modifier;
    private Date modifyDate;
    private char useYN;
}
