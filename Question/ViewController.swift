//
//  ViewController.swift
//  Question
//
//  Created by 김인규 on 11/15/24.
//

import UIKit

import FirebaseCore
import FirebaseFirestore


class ViewController: UIViewController {
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 예시 데이터를 Firestore에 추가
        let questionData = Question(contents: [
            // 팩트질문 질문들
            Question.Content(contentType: "팩트질문", contentDescription: "두 분은 어떤 관계인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "사는 지역이 어디인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "어느 회사에 재직 중 인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "졸업한 학교가 어디인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "가족 구성원이 어떻게 되나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "주말에 주로 무엇을 하나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "관심사가 무엇인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "선호하는 음식은 무엇인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "선호하지 않는 음식은 무엇인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "자주 듣는 노래는 무엇인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "꾸준히 하는 운동이 있나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "독서를 자주 하나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "주량이 어떻게 되나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "흡연을 하나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "종교는 무엇인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "정치에 관심이 있나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "운전을 하나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "연주하는 악기가 있나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "특기가 무엇인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "좋아하는 유튜브 채널이 있나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "퇴근 이후 무엇을 가장 많이 하나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "최근 다녀온 여행지는 어디인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "여행을 좋아하나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "제게 알려주고 싶은 사실이 있나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "알레르기가 있나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "대화할 주로 듣는 편인가요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "이성에게 인기가 많나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "애완동물을 키우나요?"),
            Question.Content(contentType: "팩트질문", contentDescription: "친구에게 가장 고마웠던 순간은 언제인가요?"),


            // 성격질문 질문들
            Question.Content(contentType: "성격질문", contentDescription: "강점이 무엇인가요?"),
            Question.Content(contentType: "성격질문", contentDescription: "함께 과제를 수행했을 때 기억나는 일화가 있을까요?"),
            Question.Content(contentType: "성격질문", contentDescription: "갈등 상황을 어떻게 대처하나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "인생에서 가장 중요하게 여기는 가치는 무엇인가요?"),
            Question.Content(contentType: "성격질문", contentDescription: "여가 시간을 어떻게 보내나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "가장 큰 성취라고 생각하는 것은 무엇인가요?"),
            Question.Content(contentType: "성격질문", contentDescription: "사람 관계에서 가장 중요하게 생각하는 요소는 무엇인가요?"),
            Question.Content(contentType: "성격질문", contentDescription: "10년 후 자신의 모습을 어떻게 그리고 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "일과 삶의 균형에 대해 어떻게 생각하나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "한 단어로 묘사하면 어떤 단어가 떠오르시나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "이성으로써 10점 만점에 몇점을 주고 싶으신가요? 그 이유는요?"),
            Question.Content(contentType: "성격질문", contentDescription: "가족과 함께 여행을 가는 것을 어떻게 생각하나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "친구에게 받은 가장 큰 영향은 무엇인가요?"),
            Question.Content(contentType: "성격질문", contentDescription: "버킷리스트 항목 중 아는 것이 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "이상형에 대해 들은 바가 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "자기계발에 어떤 노력을 하고 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "돈에 대해 어떤 태도를 갖고 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "소비를 결정할 때 중요하게 생각하는 원칙이 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "환경에 대한 관심을 갖고 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "어떤 상황에서 불편함을 느끼나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "성격을 잘 표현해주는 일화가 있을까요?"),
            Question.Content(contentType: "성격질문", contentDescription: "언제 가장 기쁨을 느끼나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "제가 주의해야 할 점이 있나요?"),
            Question.Content(contentType: "성격질문", contentDescription: "똑똑한 사람인가요, 열정이 많은 사람인가요?"),
            Question.Content(contentType: "성격질문", contentDescription: "꿈에 대해 말한 적이 있나요?"),



            // 경력질문 질문들
            Question.Content(contentType: "경력질문", contentDescription: "전문성을 키우기 위해 어떤 노력을 하고 있나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "이직한 경험이 있나요? 왜 이직했나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "팀 프로젝트에서 갈등이 발생했을 때 어떻게 해결했나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "어떤 리더십 스타일을 선호하나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "어떤 리더인가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "주요 업무는 무엇인가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "장점은 무엇인가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "개선이 필요한 부분이 있다면 무엇인가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "협업 스타일은 어떠한가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "시간관리 능력은 어떠한가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "성장 가능성에 대해 어떻게 생각하시나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "직업 윤리는 어떠한가요? 예시가 있나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "회사에서 가장 큰 성과는 무엇인가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "피드백을 어떻게 받아들이나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "다시 함께 일할 의향이 있으신가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "어떤 상황의 기업환경에서 추천하시나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "업무 외 활동이나 자기계발 노력에 대해 아시는 바가 있나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "업무 속도와 효율성은 어떠했나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "실수를 했을 때 어떻게 대처했나요?"),
            Question.Content(contentType: "경력질문", contentDescription: "전문 분야나 특별한 기술이 있다면 무엇인가요?"),
            Question.Content(contentType: "경력질문", contentDescription: "함께 일하는 동료로써 10점 만점에 몇점을 주고 싶으신가요? 그 이유는요?")
        ])
        addData(data: questionData)
    }
    
    func addData(data: Question) {
        guard let dataDictionary = data.asDictionary() else {
            print("questions 데이터 변환 실패")
            return
        }
        
        // "questions" 컬렉션에 문서를 추가
        db.collection("questions").document("questionId").setData(dataDictionary) { error in
            if let error = error {
                print("questions 추가 실패: \(error.localizedDescription)")
            } else {
                print("questions 추가 성공")
            }
        }
    }
}

// Question 모델 및 확장 - 딕셔너리 변환 기능 포함
struct Question: Codable {
    let contents: [Content]
    
    struct Content: Codable {
        let contentType: String
        let contentDescription: String
    }
    
    // Question 객체를 Dictionary로 변환하는 함수
    func asDictionary() -> [String: Any]? {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dictionary
        } catch {
            print("Dictionary 변환 실패: \(error)")
            return nil
        }
    }
}
