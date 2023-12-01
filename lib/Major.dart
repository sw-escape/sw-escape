import 'package:flutter/material.dart';

class Major with ChangeNotifier{
  Map<String, String> majors = {
    'Calculus':'1-1', //미적분학
    'Physics(1)':'1-1', //일반물리
    'PhysicsExperiment(1)':'1-1',//일반물리실험
    'BasicComputerProgramming':'1-1',//기초컴퓨터프로그래밍
    'LogicCircuit':'1-1',//논리회로
    'LinearAlgebra':'1-1',//선형대수학
    'DiscreteMathematics':'1-1',//이산수학
    'Programming':'1-1', // 프로그래밍
    'DataStructure':'1-1', // 자료구조
    'ComputerArchitecture':'1-1', // 컴퓨터구조
    'PrinciplesOfProgrammingLanguage':'1-1', // 프로그래밍언어론
    'SoftwareEngineering':'1-1', // 소프트웨어공학
    'OperatingSystem':'1-1', // 운영체제
    'Algorithm':'1-1', // 알고리즘
    'CreativeDesign':'1-1', //창의적설계
    'CapstoneDesign(1)':'1-1', //캡스톤디자인(1)
    'CapstoneDesign(2)':'1-1', // 캡스톤디자인(2)
    'SoftwareProject':'1-1', // 소프트웨어프로젝트
    'ObjectOrientedProgramming':'1-1', // 객체지향프로그래밍
    'DatabaseDesign':'1-1', // 데이터베이스설계
    'ArtificialIntelligence':'1-1', // 인공지능
    'DatabaseSystem':'1-1', // 데이터베이스시스템
    'NetworkApplicationAndDesign':'1-1', // 네트워크응용설계
    'DesignOfEmbeddedSystem':'1-1', // 내장형시스템설계
    // ProbabilityAndStatistics 확률과통계
    // OpenSourceSWAndPython 오픈소스SW와 파이썬 프로그래밍
    // AutomataAndFormalLanguage 오토마타와형식언어
    //'DesignThinking' : '1-1' // 디자인사고 Mach
    // OpenSourceSWProject 오픈소스SW프로젝트
    // Compiler 컴파일러
    // NumericalAnalysis 수치해석
    // CodingBootCamp 코딩부트캠프
    // ComputerCommunication 컴퓨터통신
    // ComputerGraphics 컴퓨터그래픽스
    // HumanInterfaceMedia 휴먼인터페이스미디어
    // ImageProgressing 영상처리
    // LinuxSystemApplication 리눅스시스템응용설계
    // ApplicationToPatternRecognition 패턴인식응용
    // ComputerVision 컴퓨터비전
    // InformationAndKnowledge 정보와지식
    // InformationAndSecurityTheory 정보보호이론
    // MachineLearning 머신러닝
    // MulticoreComputing 멀티코어컴퓨팅
    // NaturalLanguageProcessingInfoRetrieval 자연어처리및정보검색
    // WirelessMobileCommunication 무선이동통신
    // Business Intelligence 비즈니스 인텔리전스
    //
  };
  changeMajor(String majorName, String majorTime){
    majors[majorName] = majorTime;
    notifyListeners();
  }
  loadMajorTime(String majorName){
    notifyListeners();
    if(majors.containsKey(majorName)){
      return majors[majorName];
    } else {
      majors[majorName] = '0-0';
      return majors[majorName];
    }
  }
}