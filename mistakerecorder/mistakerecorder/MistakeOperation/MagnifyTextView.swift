//
//  MagnifyTextView.swift
//  mistakerecorder
//
//  Created by CaSdm on 2021/3/31.
//

import SwiftUI

struct MagnifyTextView: View {
    @Binding var show: Bool
    @ObservedObject var questionItem: QuestionItem
    let propety: String
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Text(Poem.getProperty(questionItem: questionItem, propety: propety).replacingOccurrences(of: "。", with: "。\n"))
                    .font(.system(size: 20))
                    .padding()
            }
            Button(action: {
                show = false
            }, label: {
                Text("取消")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
            })
        }
        .padding()
        .frame(width: 350, height: 600)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 30)
        .scaleEffect(show ? 1 : 0.5)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(show ? 0.3 : 0))
        .opacity(show ? 1 : 0)
        .animation(.linear(duration: 0.5))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MagnifyTextView_Previews: PreviewProvider {
    @State static var show = true
    @StateObject static var questionItem = QuestionItem(question: "行宫", rightAnswer: "五言绝句/寥落古行宫，宫花寂寞红。白头宫女在，闲坐说玄宗。/⑴寥落：寂寞冷落。⑵行宫：皇帝在京城之外的宫殿。/元稹的这首《行宫》是一首抒发盛衰之感的诗，可与白居易《上阳白发人》参互并观。这里的古行宫即洛阳行宫上阳宫，白头宫女即“上阳白发人”。据白居易《上阳白发人》，这些宫女天宝（742-756）末年被“潜配”到上阳宫，在这冷宫里一闭四十多年，成了白发宫人。这首短小精悍的五绝具有深邃的意境，富有隽永的诗味，倾诉了宫女无穷的哀怨之情，寄托了诗人深沉的盛衰之感。/元稹")
    static let property = "content"
    static var previews: some View {
        MagnifyTextView(show: $show, questionItem: questionItem, propety: property)
    }
}
