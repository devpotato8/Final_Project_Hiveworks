package com.dna.hiveworks.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Search {
	private int searchNo;
	private String searchKeyword;
	private String searchAddress;
	private String searchCode;
}
