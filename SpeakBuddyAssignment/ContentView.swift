/*
 * SpeakBuddy Entering View
 */

import SwiftUI
import Charts


struct ContentView: View {
    //TODO: replace injected mock data with real data
    @State var data = ChartViewModelFetcher(provider: MockChartFetcher()).chartViewData()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.sbPurple, .white]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing:0) {
                HStack {
                    Spacer()
                    closeButton
                }
                Spacer(minLength: 0)
                headerView
                Spacer(minLength: 0)
                chartView
                Spacer(minLength: 0)
                subTitleView
                Spacer(minLength: 0)
                joinButton
            }.padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        }
    }
    
    // a bar chart view with an icon on top left corner
    var chartView: some View {
        ZStack{
            VStack{
                HStack{
                    Image.sbRobot.frame(width: SBLayoutConfiguration.ChartView.iconWidth,
                                        height: SBLayoutConfiguration.ChartView.iconHeight)
                    Spacer()
                }
                Spacer()
            }
            VStack {
                Spacer()
                Chart {
                    ForEach(data) { item in
                        BarMark(
                            x: .value("x", item.data.x),
                            y: .value("y", item.animated ? item.data.y : 0),
                            width: MarkDimension(floatLiteral: SBLayoutConfiguration.ChartView.barWidth)
                        ).annotation(position: .bottom, alignment: .center, spacing: 7, content:{
                            Text(item.data.x).font(SBFont.hiragino.fontSize(SBLayoutConfiguration.ChartView.annotationSize)).bold()
                        }).foregroundStyle(LinearGradient(gradient: Gradient(colors: [.sbBlueLight, .sbBlueDark]), startPoint: .top, endPoint: .bottom))
                    }
                }.frame(width:SBLayoutConfiguration.ChartView.barPanelWidth, height:SBLayoutConfiguration.ChartView.barPanelHeight)
                    .chartYScale(domain: 0...100)
                    .chartXAxis(SBLayoutConfiguration.ChartView.xAxisVisibility ? .visible : .hidden)
                    .chartYAxis(SBLayoutConfiguration.ChartView.yAxisVisibility ? .visible : .hidden)
                    .onAppear {
                        for i in 0..<data.count {
                            withAnimation(.easeInOut(duration:0.5).delay(Double(i)*0.2)) {
                                data[i].animated = true
                            }
                        }
                    }
            }.padding(.bottom, SBLayoutConfiguration.ChartView.bottomPadding)
        }.frame(width: SBLayoutConfiguration.ChartView.width, height: SBLayoutConfiguration.ChartView.height)
    }
    
    // a circled close button
    var closeButton: some View {
        Button(action: {
            //TODO: close action
        }, label: {
            Circle()
            .fill(Color(.white))
            .frame(width: 38, height: 38)
            .overlay(
                Image(systemName: "xmark")
                    .font(SBFont.hiragino.fontSize(14)).bold()
                    .foregroundColor(.black)
            )
        })
        .buttonStyle(PlainButtonStyle())
    }
    
    // a rounded rectangular button usually placed at the bottom of a view
    var joinButton: some View {
        return Button(action: {
            //TODO: join action
        }) {
            Text(SBLocalizationString.joinButton)
                .font(SBFont.hiragino.fontSize(SBLayoutConfiguration.JoinButton.titleSize))
                .bold()

        }.foregroundColor(.white)
        .frame(width: SBLayoutConfiguration.JoinButton.width,
               height: SBLayoutConfiguration.JoinButton.height,
               alignment: .center)
        .background(Color.sbButtonBlue)
        .cornerRadius(SBLayoutConfiguration.JoinButton.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: SBLayoutConfiguration.JoinButton.cornerRadius)
                .stroke(Color.white, lineWidth: SBLayoutConfiguration.JoinButton.borderWidth)
        )
        .shadow(color: Color.black.opacity(0.2),
                radius: SBLayoutConfiguration.JoinButton.cornerRadius,
                x:0,
                y:2)
    }
    
    var headerView: some View {
        Text(SBLocalizationString.header)
            .frame(height: 84)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .font(SBFont.sfpro.fontSize(36))
            .fontWeight(.bold)
    }
    
    var subTitleView: some View {
        VStack(spacing: 0) {
            descriptionText1
            descriptionText2
        }
    }
    
    var descriptionText1: some View {
        Text(SBLocalizationString.descriptionLabel1)
            .frame(height: 30, alignment: .center)
            .font(SBFont.hiragino.fontSize(20))
            .bold()
    }
    
    var descriptionText2: some View {
        Text(SBLocalizationString.descriptionLabel2)
            .frame(height: 45, alignment: .center)
            .font(SBFont.hiragino.fontSize(30))
            .bold()
            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.sbTextBlueLight, .sbTextBlueDark]),
                                            startPoint: .top,
                                            endPoint: .bottom))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
