package com.dna.hiveworks.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
    private int boardNo;
    private String boardType;
    private String boardContent;
    private int boardCount;
    private String boardTitle;
    private String boardOriginalFilename;
    private String boardRenameFilename;
    private int creater;
    private Date createDate;
    private int modifier;
    private Date modifyDate;
    private char useYN;
    private List<Uploadfile> files;
}
