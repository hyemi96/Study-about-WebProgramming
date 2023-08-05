# 마이바티스, index 사용한 경험
- 예시)
- SELECT *
FROM table_name
WHERE contract_number IN 
<foreach collection="orderList" item="item" open="(" separator="," close=")">
  #{item}
</foreach>
ORDER BY 
  CASE 
    <foreach collection="orderList" item="item" index="index" separator=" ">
      WHEN contract_number = #{item}
        <choose>
          <when test="index % 2 == 0">
            AND price_table = '02' THEN #{index+1}
          </when>
          <otherwise>
            AND price_table = '01' THEN #{index+1}
          </otherwise>
        </choose>
      </when>
      WHEN contract_number = #{item}
        <choose>
          <when test="index % 2 == 0">
            AND price_table = '04' THEN #{index+1}
          </when>
          <otherwise>
            AND price_table = '03' THEN #{index+1}
          </otherwise>
        </choose>
      </when>
    </foreach>
  END

# order by 에 파라미터값을 넣어서 직접 order by 를 만든경험
- 예시)
- SELECT *
FROM table_name
WHERE contract_number IN ('계약번호1', '계약번호2', '계약번호3', ...)
ORDER BY
    CASE 
        WHEN contract_number = '계약번호1' AND price_table = '02' THEN 1
        WHEN contract_number = '계약번호1' AND price_table = '01' THEN 2
        WHEN contract_number = '계약번호2' AND price_table = '04' THEN 3
        WHEN contract_number = '계약번호2' AND price_table = '03' THEN 4
        WHEN contract_number = '계약번호3' AND price_table = '02' THEN 5
        WHEN contract_number = '계약번호3' AND price_table = '01' THEN 6
        WHEN contract_number = '계약번호1' AND price_table = '04' THEN 7
        WHEN contract_number = '계약번호1' AND price_table = '03' THEN 8
        ELSE 9
    END;

# moerge into 쿼리 사용
- 업데이트 할대 조건 식 사용했던 방법

# 유니온 하면 그룹바이절을 쓸수 없다는 것

# 달러 기호 ($)를 사용하는 변수
- 달러 기호는 보통 문자열 또는 스크립트에서 변수를 표시하는 데 사용됩니다. SQL 쿼리에서 $ 기호를 사용하면 일반적으로 문자열 치환을 의미합니다. 쿼리에서 $ 기호로 표시된 변수는 일반 텍스트로 취급되며, 데이터베이스 쿼리 파싱 시에 해당 변수의 값을 데이터베이스가 인식하지 않습니다. 따라서 $ 기호로 표시된 변수는 보안 문제를 발생시킬 수 있으며, SQL 인젝션 공격에 노출될 수 있습니다. 따라서 $ 기호를 사용하는 변수를 동적으로 쿼리에 넣는 것은 권장되지 않습니다.
간단히 말하면, 바인드 변수(#{})는 쿼리의 파라미터로 사용되어 안전한 방식으로 값을 전달하는 데 사용되는 반면, $ 기호를 사용하는 변수는 동적으로 쿼리에 값이 삽입되는 방식으로 보안 문제를 야기할 수 있습니다. 따라서 SQL 쿼리에서는 바인드 변수를 사용하는 것이 안전하고 권장되는 방법입니다.
