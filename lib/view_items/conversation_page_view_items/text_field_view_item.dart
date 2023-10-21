import 'package:flutter/material.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../constant/color.dart';
import '../../constant/dimens.dart';

class TextingMessageItemView extends StatelessWidget {
  const TextingMessageItemView({super.key, required this.isTyping});

  final bool isTyping;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: kSP5x, left: kSP15x, right: kSP10x),
      height: kTextFieldSessionHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: kTextFieldHeight,
              padding: const EdgeInsets.only(left: kSP15x),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(kSP30x),
              ),
              child: TextField(
                maxLines: 100000,
                textInputAction: TextInputAction.send,
                controller: context
                    .getConversationPageBlocInstance()
                    .textEditingController,
                onChanged: (value) => context
                    .getConversationPageBlocInstance()
                    .isSendMessage(value),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Message....',
                    suffixIcon: (isTyping)
                        ? const Icon(
                            Icons.search_rounded,
                            color: kGreyColor,
                          )
                        : const Icon(
                            Icons.sentiment_satisfied_alt,
                            color: kGreyColor,
                          )),
              ),
            ),
          ),
          const SizedBox(
            width: kSP15x,
          ),
          GestureDetector(
              onTap: () {
                context.getConversationPageBlocInstance().stateMessaging();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: kSP10x),
                child: Center(
                    child: Icon(
                  Icons.send_rounded,
                  color: kPrimaryColor,
                )),
              ))
        ],
      ),
    );
  }
}
