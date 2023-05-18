//
//  ChallengItemView.swift
//  Increment
//
//  Created by Kul Boonanake on 18/5/23.
//

import SwiftUI

struct ChallegeItemView: View {
    private let viewModel: ChallengeItemViewModel
    init(viewModel: ChallengeItemViewModel) {
        self.viewModel = viewModel
    }
    
    var titleRow: some View {
        HStack {
            Text(viewModel.title)
                .font(.system(size: 24, weight: .bold))
            Spacer()
            Image(systemName: "trash").onTapGesture {
                viewModel.send(action: .delete)
            }
        }
    }
    
    var dailyIncreaseRow: some View {
        HStack {
            Text(viewModel.dailyIncreaseText)
                .font(.system(size: 24, weight: .bold))
            Spacer()
        }
    }
    
    var todayView: some View {
        VStack {
            Divider()
            Text(viewModel.todayTitle)
                .font(.title3)
                .fontWeight(.medium)
            Text(viewModel.todayRepTitle)
                .font(.system(size: 24, weight: .bold))
            Button(viewModel.isDayComplete || viewModel.isComplete ? "Completed" : "Mark Done") {
                viewModel.send(action: .toggleComplete)
            }
            .disabled(viewModel.isComplete)
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .font(Font.caption.weight(.semibold))
            .background(viewModel.isDayComplete ? Color.circleTrack : Color.primaryButton)
            .cornerRadius(8)
        }
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 25) {
                titleRow
                ProgressCircleView(
                    viewModel: viewModel.progressCircleViewModel
                )
                dailyIncreaseRow
                todayView
                
            }.padding(.vertical, 10)
            Spacer()
        }
        .background(
            Rectangle()
                .fill(Color.primaryButton)
                .cornerRadius(5)
        )
    }
    
}
