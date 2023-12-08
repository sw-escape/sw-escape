import 'package:flutter/material.dart';

class Major with ChangeNotifier{
  Map<String, String> majors = {
    /*
    'Calculus':'0-0', //미적분학
    'Physics(1)':'0-0', //일반물리
    'PhysicsExperiment(1)':'0-0',//일반물리실험
    'BasicComputerProgramming':'0-0',//기초컴퓨터프로그래밍
    'LogicCircuit':'1-1',//논리회로
    'LinearAlgebra':'1-1',//선형대수학
    'DiscreteMathematics':'0-0',//이산수학
    'Programming':'1-1', // 프로그래밍
    'DataStructure':'1-1', // 자료구조
    'ComputerArchitecture':'1-1', // 컴퓨터구조
    'PrinciplesOfProgrammingLanguage':'1-1', // 프로그래밍언어론
    'SoftwareEngineering':'1-1', // 소프트웨어공학
    'Algorithm':'1-1', // 알고리즘
    'OperatingSystem':'1-1', // 운영체제
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
    'AdvancedIoTProject':'0-0' //고급IoT프로젝트
     */
    // NumericalAnalysis 수치해석
    // ProbabilityAndStatistics 확률과통계
    //'DesignThinking' : '1-1' // 디자인사고 Mach

    // OpenSourceSWAndPython 오픈소스SW와 파이썬 프로그래밍 1-1
    // AffectiveComputing 감성컴퓨팅 2-1
    // ComputerSystemAndAssemblyLang 컴퓨터시스템및어셈블리언어 2-1
    // AutomataAndFormalLanguage 오토마타와형식언어 2-2
    // OpenSourceSWProject 오픈소스SW프로젝트 3-1
    // Compiler 컴파일러 3-1
    // LinuxSystemApplication 리눅스시스템응용설계 3-2
    // AppDevelopmentForMobile 모바일앱개발 3-2
    // BusinessIntelligence 비즈니스 인텔리전스 3-2
    //IndustryHandsOnPj 산업체핸즈온프로젝트 3-2
    // ImageProgressing 영상처리 3-2
    // ComputerGraphics 컴퓨터그래픽스 3-2
    // ComputerCommunication 컴퓨터통신 3-2
    // CodingBootCamp 코딩부트캠프 3-2
    // HumanInterfaceMedia 휴먼인터페이스미디어 3-2
    // MachineLearning 머신러닝 4-1
    // MulticoreComputing 멀티코어컴퓨팅 4-1
    // WirelessMobileCommunication 무선이동통신 4-1
    // NatLangProcInfoRetrieval 자연어처리및정보검색 4-1
    // InformationAndSecurityTheory 정보보호이론 4-1
    // InformationAndKnowledge 정보와지식 4-1
    // ComputerVision 컴퓨터비전 4-1
    // IntroPatternRecognition 패턴인식 4-1
    // VRAugmentedMixedReality 가상증강 혼합 현실 4-2
    // MachineVisionPj 로봇비전프로젝트 4-2
    // MachineLearningPj 머신러닝프로젝트 4-2
    // BigData 빅데이터 4-2
    // DesignPattern 설계 패턴 4-2
    // ConvergentIoTPjDesign 융합 IoT 프로젝트 설계 4-2
    // DesignOfGameSW 컴퓨터게임설계 4-2
    // AppToPatternRecognition 패턴인식응용 4-2
    // Internship 인턴쉽
    //
  };
  changeMajor(String majorName, String majorTime){
    majors[majorName] = majorTime;
    notifyListeners();
  }
  //새로 추가할 때와 아닐 때 구분 가능
  loadMajorTime(String majorName){
    notifyListeners();
    //이미 있는 경우
    if(majors.containsKey(majorName)){
      return majors[majorName];
    } else {
      majors[majorName] = '0-0';
      return majors[majorName];
    }
  }
}
