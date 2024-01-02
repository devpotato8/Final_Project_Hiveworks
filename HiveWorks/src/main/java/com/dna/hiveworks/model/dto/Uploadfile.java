package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Uploadfile {

	private int uploadfileNo;
	private int uploadfileBoardNo;
	private String originalFileName;
	private String reNamefile;
}
